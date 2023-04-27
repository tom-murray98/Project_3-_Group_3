#!/bin/bash
#SBATCH --job-name=GATK_group3
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=12:00:00
#SBATCH --output= /shared/home/mbxtm2/DivergenceScan/GATK.out
#SBATCH --error /shared/home/mbxtm2/DivergenceScan/GATK.err

conda activate /shared/home/mbxtm2/miniconda3/envs/my-pong-env

gatk SelectVariants -V LAB_NEN_ODN.clean_BI.ann.vcf.gz -sn LAB_1 -sn LAB_2 -sn LAB_300 -sn LAB_4 -sn LAB_004 -sn LAB_400 -sn LAB_5 -sn LAB_500 -O LAB_AF_filt.vcf
gatk SelectVariants -V LAB_NEN_ODN.clean_BI.ann.vcf.gz -sn NEN_001 -sn NEN_003 -sn NEN_200 -sn NEN_300 -sn NEN_4 -sn NEN_5 -sn NEN_6 -O NEN_AF_filt.vcf
gatk SelectVariants -V LAB_NEN_ODN.clean_BI.ann.vcf.gz -sn ODN_2 -sn ODN_4 -sn ODN_5 -sn ODN_6 -sn ODN_7 -sn ODN_9 -sn ODN_10 -O ODN_AF_filt.vcf

gatk VariantsToTable -V LAB_AF_filt.vcf -R excelsa_V5.fa -F CHROM -F POS -F AC -F AN -F DP -GF GT -O LAB_AF_RAW.table
gatk VariantsToTable -V NEN_AF_filt.vcf -R excelsa_V5.fa -F CHROM -F POS -F AC -F AN -F DP -GF GT -O NEN_AF_RAW.table
gatk VariantsToTable -V ODN_AF_filt.vcf -R excelsa_V5.fa -F CHROM -F POS -F AC -F AN -F DP -GF GT -O ODN_AF_RAW.table
