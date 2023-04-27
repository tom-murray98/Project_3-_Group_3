#!/bin/bash
#SBATCH --job-name=Scantools_group3
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=12:00:00
#SBATCH --output= /shared/home/mbxtm2/DivergenceScan/scantools.out
#SBATCH --error /shared/home/mbxtm2/DivergenceScan/scantools.err

conda activate /shared/home/mbxtm2/miniconda3/envs/my-py

# recode012.py

        # LAB
        python3 /shared/home/mbxtm2/Scantools_LIFE4137/recode012.py -i LAB_AF_RAW.table -o /shared/home/mbxtm2/Scantools_LIFE4137/ -pop LAB
        # NEN
        python3 /shared/home/mbxtm2/Scantools_LIFE4137/recode012.py -i NEN_AF_RAW.table -o /shared/home/mbxtm2/Scantools_LIFE4137/ -pop NEN
        # ODN
        python3 /shared/home/mbxtm2/Scantools_LIFE4137/recode012.py -i ODN_AF_RAW.tablee -o /shared/home/mbxtm2/Scantools_LIFE4137/ -pop ODN
    

# Merge multiple files

        # LAB and NEN
        python3 /shared/home/mbxtm2/Scantools_LIFE4137/Sian_sort_for_ScanTools.py 'LAB.table.recode.txt NEN.table.recode.txt ' /gpfs01/home/sbzsmb/Cochlearia/ScanTools/Temp/ LAB_VS_NEN

        # LAB and ODN
        python3 /shared/home/mbxtm2/Scantools_LIFE4137/Sian_sort_for_ScanTools.py 'LAB.table.recode.txt ODN.table.recode.txt ' /gpfs01/home/sbzsmb/Cochlearia/ScanTools/Temp/ LAB_VS_ODN


# Into bmp.py

        # LAB_VS_NEN
        python3 /shared/home/mbxtm2/Scantools_LIFE4137/sian_bpm.py -i LAB_VS_NEN.concat.txt -o /shared/home/mbxtm2/Scantools_LIFE4137/BPM -prefix LAB_VS_NEN -ws 1000 -ms 15 -np 2

        # LAB_VS_ODN
        python3 /shared/home/mbxtm2/Scantools_LIFE4137/sian_bpm.py -i LAB_VS_ODN.concat.txt -o /shared/home/mbxtm2/Scantools_LIFE4137/BPM -prefix LAB_VS_ODN -ws 1000 -ms 15 -np 2


conda deactivate 
