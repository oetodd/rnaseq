#!/usr/bin/env bash

#SBATCH --job-name=test_RNAseq_pipeline 
#SBATCH --nodes=1
#SBATCH --ntasks=24      # modify this number to reflect how many cores you want to use (up to 24)
#SBATCH --partition=shas-testing  #modify this to reflect which queue you want to use. Options are 'shas' and 'shas-testing'
#SBATCH --qos=testing     # modify this to reflect which queue you want to use. Options are 'normal' and 'testing'
#SBATCH --time=1:00:00   # modify this to reflect how long to let the job go. 
#SBATCH --output=log_RNAseq_pipe_%j.txt



## Source software
source /projects/oetodd@colostate.edu/summit-rna-seq-setup/activate.bashrc
  ######### CHANGE <eID> TO YOUR EID: ############

## execute the RNA-seq_pipeline
bash RNAseq_analyzer_112020.sh ../conyza_metadata.txt $SLURM_NTASKS
   ######### MODIFY the SECOND argument to point to YOUR metadata.file ######### 

## OR, you can use a python script
#python RNAseq_analyzer_181011.py ../01_input/metadata_gomezOrte.txt $SLURM_NTASKS


## clean up by zipping .fastq files and deleting extra files
#bash RNAseq_cleanup_mouse_181011.sh ../04_testing/metadata_mouse.txt
   ######### modify the SECOND argument to point to YOUR metadata.file ######### 
