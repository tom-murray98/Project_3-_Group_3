#!/bin/bash
#SBATCH --job-name=bedtools
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=24:00:00
#SBATCH --output=/shared/home/mbxtm2/DivergenceScan/bedtools.out
#SBATCH --error=/shared/home/mbxtm2/DivergenceScan/bedtools.err

#activate Conda and change directory
source $HOME/.bash_profile
conda activate /shared/home/mbxtm2/miniconda3/envs/Divergence1


bedtools intersect -a /shared/home/mbxtm2/Data/C_excelsa_V5_braker2_wRseq.gff3 -b /shared/home/mbxtm2/DivergenceScan/LAB_VS_NEN_BPM_0.1.bed -wa > LAB_Vs_NEN_Final_0.1.txt
bedtools intersect -a /shared/home/mbxtm2/Data/C_excelsa_V5_braker2_wRseq.gff3 -b /shared/home/mbxtm2/DivergenceScan/LAB_VS_ODN_BPM_0.1.bed -wa > LAB_Vs_ODN_Final_0.1.txt
