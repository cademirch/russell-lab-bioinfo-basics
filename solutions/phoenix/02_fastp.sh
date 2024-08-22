#!/bin/bash

#SBATCH --job-name=fastp_processing
#SBATCH --output=/private/groups/russelllab/cade/bioinfo-basics/slurm/out/fastp_processing_%j.out
#SBATCH --error=/private/groups/russelllab/cade/bioinfo-basics/slurm/err/fastp_processing_%j.err
#SBATCH --partition=medium
#SBATCH --cpus-per-task=6
#SBATCH --time=04:00:00  # Adjust time as necessary

# Activate the conda environment
source ~/.bashrc
conda activate bioinfo-basics  # Replace with your conda environment name

# Define the path to your data
data_path="/private/groups/russelllab/cade/bioinfo-basics/fly-data"
output_path="/private/groups/russelllab/cade/bioinfo-basics/output/fastp"
mkdir -p $output_path

# List of sample prefixes
samples=("Dsimulans_wRi-Riv84" "WT-DsimwRi-line5A" "WT-DsimwRi-line5B" "WT-DsimwRi-line6A" "WT-DsimwRi-line6B" "WT-DsimwRi-line7A" "WT-DsimwRi-line7B" "WT-DsimwRi-line8A" "WT-DsimwRi-line8B")

# Loop through each sample and run fastp
for sample in "${samples[@]}"
do
  fastp -i ${data_path}/${sample}_R1.fastq.gz \
        -I ${data_path}/${sample}_R2.fastq.gz \
        -o ${output_path}/${sample}_R1_trimmed.fastq.gz \
        -O ${output_path}/${sample}_R2_trimmed.fastq.gz \
        --thread=6 \
        --html=${output_path}/${sample}_fastp.html \
        --json=${output_path}/${sample}_fastp.json

  echo "Completed fastp for ${sample}"
done

# Deactivate the conda environment
conda deactivate
