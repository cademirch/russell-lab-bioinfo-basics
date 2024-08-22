#!/bin/bash

wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/016/746/395/GCF_016746395.2_Prin_Dsim_3.1/GCF_016746395.2_Prin_Dsim_3.1_genomic.fna.gz -O /hb/home/cmirchan/bioinfo-basics/output/genome/dsim.fna.gz
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/022/285/GCF_000022285.1_ASM2228v1/GCF_000022285.1_ASM2228v1_genomic.fna.gz -O /hb/home/cmirchan/bioinfo-basics/output/genome/wri.fna.gz

cat /hb/home/cmirchan/bioinfo-basics/output/genome/dsim.fna.gz /hb/home/cmirchan/bioinfo-basics/output/genome/wri.fna.gz > /hb/home/cmirchan/bioinfo-basics/output/genome/combined.fna.gz

bwa index /hb/home/cmirchan/bioinfo-basics/output/genome/combined.fna.gz