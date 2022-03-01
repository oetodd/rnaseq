#!/usr/bin/env bash
 
#SBATCH --job-name=execute_hisat2-build
#SBATCH --nodes=1
#SBATCH --ntasks=6 # modify this number to reflect how many cores you want to use (up to 24)
#SBATCH --partition=shas-testing
#SBATCH --qos=testing     # modify this to reflect which queue you want to use. Options are 'normal' and 'testing'
#SBATCH --time=0:29:00    # modify this to reflect how long to let the job go. This indicates 4 hours.
#SBATCH --output=log_hisat2-build_%J.txt   #This will spit out a log file
 
# Load software:
source /scratch/summit/oetodd@colostate.edu/activate.bashrc
 
# Build hisat2 indexes:
hisat2-build -p 6 Bs_v2_OGS_CDS.fna Bs_CDS