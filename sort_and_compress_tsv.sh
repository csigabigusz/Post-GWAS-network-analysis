#!/bin/bash

for file in $(ls /mnt/data1/Csilla/msc_thesis/opentargets_tsvs/*)
do
    echo $file
    zcat $file | awk '{if ($2==1) print $0}' >> /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_1.tsv
done 
gzip /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_1.tsv
for file in $(ls /mnt/data1/Csilla/msc_thesis/opentargets_tsvs/*)
do
    echo $file
    zcat $file | awk '{if ($2==2) print $0}' >> /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_2.tsv
done 
gzip /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_2.tsv
for file in $(ls /mnt/data1/Csilla/msc_thesis/opentargets_tsvs/*)
do
    echo $file
    zcat $file | awk '{if ($2==3) print $0}' >> /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_3.tsv
done 
gzip /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_3.tsv
for file in $(ls /mnt/data1/Csilla/msc_thesis/opentargets_tsvs/*)
do
    echo $file
    zcat $file | awk '{if ($2==4) print $0}' >> /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_4.tsv
done
gzip /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_4.tsv 
for file in $(ls /mnt/data1/Csilla/msc_thesis/opentargets_tsvs/*)
do
    echo $file
    zcat $file | awk '{if ($2==5) print $0}' >> /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_5.tsv
done 
gzip /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_5.tsv
for file in $(ls /mnt/data1/Csilla/msc_thesis/opentargets_tsvs/*)
do
    echo $file
    zcat $file | awk '{if ($2==6) print $0}' >> /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_6.tsv
done 
gzip /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_6.tsv
for file in $(ls /mnt/data1/Csilla/msc_thesis/opentargets_tsvs/*)
do
    echo $file
    zcat $file | awk '{if ($2==7) print $0}' >> /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_7.tsv
done 
gzip /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_7.tsv
for file in $(ls /mnt/data1/Csilla/msc_thesis/opentargets_tsvs/*)
do
    echo $file
    zcat $file | awk '{if ($2==8) print $0}' >> /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_8.tsv
done 
gzip /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_8.tsv
for file in $(ls /mnt/data1/Csilla/msc_thesis/opentargets_tsvs/*)
do
    echo $file
    zcat $file | awk '{if ($2==9) print $0}'  >> /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_9.tsv
done 
gzip /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_9.tsv
for file in $(ls /mnt/data1/Csilla/msc_thesis/opentargets_tsvs/*)
do
    echo $file
    zcat $file | awk '{if ($2==10) print $0}' >> /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_10.tsv
done 
gzip /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_10.tsv
for file in $(ls /mnt/data1/Csilla/msc_thesis/opentargets_tsvs/*)
do
    echo $file
    zcat $file | awk '{if ($2==11) print $0}' >> /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_11.tsv
done
gzip /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_11.tsv 
for file in $(ls /mnt/data1/Csilla/msc_thesis/opentargets_tsvs/*)
do
    echo $file
    zcat $file | awk '{if ($2==12) print $0}'  >> /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_12.tsv
done 
gzip /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_12.tsv
for file in $(ls /mnt/data1/Csilla/msc_thesis/opentargets_tsvs/*)
do
    echo $file
    zcat $file | awk '{if ($2==13) print $0}'  >> /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_13.tsv
done 
gzip /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_13.tsv
for file in $(ls /mnt/data1/Csilla/msc_thesis/opentargets_tsvs/*)
do
    echo $file
    zcat $file | awk '{if ($2==14) print $0}' >> /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_14.tsv
done 
gzip /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_14.tsv
for file in $(ls /mnt/data1/Csilla/msc_thesis/opentargets_tsvs/*)
do
    echo $file
    zcat $file | awk '{if ($2==15) print $0}'  >> /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_15.tsv
done 
gzip /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_15.tsv
for file in $(ls /mnt/data1/Csilla/msc_thesis/opentargets_tsvs/*)
do
    echo $file
    zcat $file | awk '{if ($2==16) print $0}'  >> /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_16.tsv
done 
gzip /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_16.tsv
for file in $(ls /mnt/data1/Csilla/msc_thesis/opentargets_tsvs/*)
do
    echo $file
    zcat $file | awk '{if ($2==17) print $0}'  >> /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_17.tsv
done 
gzip /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_17.tsv
for file in $(ls /mnt/data1/Csilla/msc_thesis/opentargets_tsvs/*)
do
    echo $file
    zcat $file | awk '{if ($2==18) print $0}'  >> /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_18.tsv
done
gzip /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_18.tsv 
for file in $(ls /mnt/data1/Csilla/msc_thesis/opentargets_tsvs/*)
do
    echo $file
    zcat $file | awk '{if ($2==19) print $0}'  >> /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_19.tsv
done 
gzip /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_19.tsv
for file in $(ls /mnt/data1/Csilla/msc_thesis/opentargets_tsvs/*)
do
    echo $file
    zcat $file | awk '{if ($2==20) print $0}'  >> /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_20.tsv
done 
gzip /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_20.tsv
for file in $(ls /mnt/data1/Csilla/msc_thesis/opentargets_tsvs/*)
do
    echo $file
    zcat $file | awk '{if ($2==21) print $0}' >> /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_21.tsv
done 
gzip /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_21.tsv
for file in $(ls /mnt/data1/Csilla/msc_thesis/opentargets_tsvs/*)
do
    echo $file
    zcat $file | awk '{if ($2==22) print $0}' >> /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_22.tsv
done 
gzip /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_22.tsv
for file in $(ls /mnt/data1/Csilla/msc_thesis/opentargets_tsvs/*)
do
    echo $file
    zcat $file | awk '{if ($2=="X") print $0}' >> /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_X.tsv
done 
gzip /mnt/data1/Csilla/msc_thesis/chrom-sorted_tsvs/chrom_X.tsv
