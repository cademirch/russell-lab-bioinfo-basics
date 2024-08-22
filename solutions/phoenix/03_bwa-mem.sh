#!/bin/bash

#SBATCH --job-name=bwa_mapping_array
#SBATCH --output=/private/groups/russelllab/cade/bioinfo-basics/slurm/out/bwa_mapping_%A_%a.out
#SBATCH --error=/private/groups/russelllab/cade/bioinfo-basics/slurm/err/bwa_mapping_%A_%a.err
#SBATCH --partition=medium
#SBATCH --cpus-per-task=6
#SBATCH --time=08:00:00  # Adjust time as necessary
#SBATCH --array=0-8  # Array indices (one for each sample)

# Activate the conda environment
source ~/.bashrc
conda activate bioinfo-basics  # Replace with your conda environment name

# Define the path to your data and reference genome
data_path="/private/groups/russelllab/cade/bioinfo-basics/fly-data"
output_path="/private/groups/russelllab/cade/bioinfo-basics/output"
reference_genome="/private/groups/russelllab/cade/bioinfo-basics/output/genome/combined.fna.gz"  # Replace with actual reference genome path
mkdir -p $output_path

# List of sample prefixes
samples=("Dsimulans_wRi-Riv84" "WT-DsimwRi-line5A" "WT-DsimwRi-line5B" "WT-DsimwRi-line6A" "WT-DsimwRi-line6B" "WT-DsimwRi-line7A" "WT-DsimwRi-line7B" "WT-DsimwRi-line8A" "WT-DsimwRi-line8B")

# Get the current sample based on the SLURM array index
sample=${samples[$SLURM_ARRAY_TASK_ID]}

# Run BWA and samtools sort
bwa mem -t 6 $reference_genome ${output_path}/fastp/${sample}_R1_trimmed.fastq.gz ${output_path}/fastp/${sample}_R2_trimmed.fastq.gz | \
samtools sort -@ 6 -o ${output_path}/${sample}.sorted.bam

echo "Completed BWA mapping and sorting for ${sample}"

# Deactivate the conda environment
conda deactivate
