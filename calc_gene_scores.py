import gzip
import os
import math
import sys

hg_38=sys.argv[1]
rsfile=sys.argv[2]
output_folder=sys.argv[3]

v2g_data_folder = '/mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs'
gene_sub_scores = output_folder + "/gene_sub_scores.txt" # to write
cleaned_v2g = output_folder + '/uniq_sub_scores.txt' # to write # to read if already calculated
final_OT_scores = output_folder + '/final_OT_scores.txt' # to write
final_OT_scores = output_folder + '/final_OT_scores_maxV2G.txt' # to write

print("Read hg38 positions")
pos_dict2={}  # store set of positions by chromosomes: pos_dict2[chrom][pos]=rsID
with open(hg_38, 'r') as hg38:
    hg38.readline()
    for line in hg38:
        chr = line.split('\t')[0].strip().replace('chr', '')
        pos = str(int(line.split('\t')[1])+1)
        rsid = line.split('\t')[3]
        try:
            pos_dict2[chr][pos]=rsid
        except KeyError:
            pos_dict2[chr]={}


# read p-value to rsids
print("Read p-values")
pvals={} # to store rsid:pval pairs
with open(rsfile,'r') as pfile:
    pfile.readline()
    for line in pfile:
        try:
            [rsid, pval] = line.strip().split('\t')
            pvals[rsid] = pval
        except:
            print("wrong formatting of:", line.strip())



# filter chrom-sorted v2g tsv-s & save chrom,pos,gene,score,type:subscore
print("Filtering V2G files")
with open(gene_sub_scores, 'w') as subs_wf: 
    for chrom in pos_dict2.keys():
        print('filtering v2g for:',chrom)
        ifile = v2g_data_folder + '/chrom_' + chrom + '.tsv.gz'
        try:
            with gzip.open(ifile, 'r') as f:
                f.readline()
                for line in f:
                    ls = line.decode()
                    pos = ls.split('\t')[2]
                    if pos in pos_dict2[chrom].keys():
                        gene = ls.split('\t')[5]
                        score = ls.split('\t')[6]
                        type = ls.split('\t')[7]
                        text= chrom + '\t' + pos + '\t' + gene + '\t' + score + '\t' + type +'\n'

                        subs_wf.write(text)
        except:
            print(ifile, 'Not found')

# make v2g links uniq 
print("Remove redundancy of filtered V2G")
cleaning_cmd = "sort -n " + gene_sub_scores + "| cut -f 1,2,3,4 | uniq > " + cleaned_v2g
os.system(cleaning_cmd)



# calculation of gene-score
print("Calculating gene scores from SNPs with rsID")
gene_dict={} # store gene:[OTscore, weighted_score, positions]
with open(cleaned_v2g, 'r') as v2gf:
    for line in v2gf:
        chrom, pos, gene, score = line.strip().split('\t')
        rsid=pos_dict2[chrom][pos]
        try:
            pval=pvals[rsid]
        except:
            pval=1 # results multiplying with 0
            print(rsid, "not in rsid-pval dict")

        if gene in gene_dict:
            gene_dict[gene][0] = gene_dict[gene][0] + float(score)
            gene_dict[gene][1] = gene_dict[gene][1] + float(score) * -1*math.log10(float(pval))
            gene_dict[gene][2].add(pos)
            if float(score)*-1*math.log10(float(pval)) > gene_dict[gene][3]:
                gene_dict[gene][3]=float(score)*-1*math.log10(float(pval))
        else:
            positions=set()
            positions.add(pos)
            gene_dict[gene]=[float(score),float(score) * -1*math.log10(float(pval)), positions,float(score)*-1*math.log10(float(pval))]


print("Writing final gene-score results")
with open(final_OT_scores, 'w') as wf:
   for gene in gene_dict:
        wf.write(gene + '\t' + str(gene_dict[gene][0])+ '\t' + str(gene_dict[gene][1])+ '\t' + str(len(gene_dict[gene][2])) + '\t' + str(gene_dict[gene][3]) + '\n')
