# Project_3_Group_3

All scripts used in project 3 by Group 3.

All batch scripts were run via the University of Nottingham HPC and SLURM.

PCA_R.R - 
Generation of PCA plots for all populations of Cochlearia

ADMIXTURE.sh - 
Similar to fastSTRUCTURE, installed and ran following the pipeline instructions on https://speciationgenomics.github.io/ADMIXTURE/

PONG.txt - (https://github.com/ramachandran-lab/pong) was runas a visualisation of ADMIXTURE

GATK.sh -
The first step in filtering the individuals LAB, NEN and ODN from raw VCF (this step is redundant in the case of prefiltered file). The second step to filter the individuals variant data by CHROM POS AC AN DP for implementation of genetic scans.

Scantools.sh - 
Takes output from gatk and splits VCFs based on population, then merges two population files for downstream analysis. 
Using pipeline from Scantools : https://github.com/pmonnahan/ScanTools .
Conda environment created in the command line for local usage using packages listed on github
