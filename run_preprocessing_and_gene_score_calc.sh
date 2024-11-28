#!/bin/bash

#-------------------------------------------------------------------------------------------
# download OpenTargets parquet files:
#-------------------------------------------------------------------------------------------
for fname in $(cut -f 2 /home/ubuntu/Csilla/msc_thesis/opentargets_v2g_files.txt)
do 
  echo $fname 
  wget https://ftp.ebi.ac.uk/pub/databases/opentargets/genetics/latest/v2g_scored/$fname
done

#-------------------------------------------------------------------------------------------
# convert parquet files to tsv:
#-------------------------------------------------------------------------------------------
for fname in $(ls /mnt/data1/Csilla/msc_thesis/raw_opentargets_parquets/*.parquet)
do 
      python3 parquet2tsv.py $fname
done

#-------------------------------------------------------------------------------------------
# sort and compress tsvs:
#-------------------------------------------------------------------------------------------
bash sort_and_compress_tsv.sh

#-------------------------------------------------------------------------------------------
# preprocess GWAS summary statistics:
#-------------------------------------------------------------------------------------------
# filtering with 5*10-8 and 5*10-6 threshold in Excel
# save list of rsids from Excel
# save rsids and corresponding p-values from Excel
# convert rsids to hg38 positions by https://genome.ucsc.edu/cgi-bin/hgTables

#-------------------------------------------------------------------------------------------
# calculation of gene-scores:
#-------------------------------------------------------------------------------------------
WORKDIR="/mnt/data1/Csilla/msc_thesis"

python3 calc_gene_scores.py $WORKDIR/02_hg38_coordinates/p510-8/dori_p510-8.txt $WORKDIR/rsid-pval-dict/dori_rs-pval.txt $WORKDIR/results/dori_results_p510-8
python3 calc_gene_scores.py $WORKDIR/02_hg38_coordinates/p510-6/dori_p510-6.txt $WORKDIR/rsid-pval-dict/dori_rs-pval.txt $WORKDIR/results/dori_results_p510-6

python3 calc_gene_scores.py $WORKDIR/02_hg38_coordinates/p510-8/choquet_p510-8.txt $WORKDIR/rsid-pval-dict/Choquet_rs-pval.txt $WORKDIR/results/choquet_results_p510-8
python3 calc_gene_scores.py $WORKDIR/02_hg38_coordinates/p510-6/choquet_p510-6.txt $WORKDIR/rsid-pval-dict/Choquet_rs-pval.txt $WORKDIR/results/choquet_results_p510-6

python3 calc_gene_scores.py $WORKDIR/02_hg38_coordinates/gormley8_hg38.txt $WORKDIR/rsid-pval-dict/gormley8_rs-pval.txt $WORKDIR/results/gormley3_results_p510-8
python3 calc_gene_scores.py $WORKDIR/02_hg38_coordinates/gormley6_hg38.txt $WORKDIR/rsid-pval-dict/gormley6_rs-pval.txt $WORKDIR/results/gormley3_results_p510-6

#-------------------------------------------------------------------------------------------
# gene id conversion:
#-------------------------------------------------------------------------------------------
# ensemble gene id conversion to NCBI gene id and gene symbol with https://www.syngoportal.org/convert
