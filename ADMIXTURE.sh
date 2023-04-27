#!/bin/bash
#SBATCH --job-name=ADMIXTURE
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=48:00:00
#SBATCH --output=/shared/home/mbxtm2/ADMIXTURE/ADMIXTURE.out
#SBATCH --error=/shared/home/mbxtm2/ADMIXTURE/ADMIXTURE.err

source $HOME/.bash_profile
conda activate /shared/home/mbxtm2/miniconda3/envs/admixture

admixture --cv LAB_NEN_ODN.bed 3 > log3.out
admixture --cv LAB_NEN_ODN.bed 4 > log4.out
admixture --cv LAB_NEN_ODN.bed 5 > log5.out
admixture --cv LAB_NEN_ODN.bed 6 > log6.out
admixture --cv LAB_NEN_ODN.bed 7 > log7.out
admixture --cv LAB_NEN_ODN.bed 8 > log8.out

conda deactivate
