import sys
import os
import pandas as pd

abspath=os.path.abspath(sys.argv[1])

out_folder='/mnt/data1/Csilla/msc_thesis/opentargets_tsvs'
filename=os.path.basename(sys.argv[1])
ofname=filename.split('-')[0] + filename.split('-')[1] + filename.split('-')[-1].split('.')[0] + '.tsv'

print('processing', abspath)
collist=['chr_id', 'position', 'ref_allele', 'alt_allele', 'gene_id','overall_score','source_list','source_score_list']
df = pd.read_parquet(abspath, columns=collist)
df.to_csv(os.path.join(out_folder,ofname), sep="\t")
