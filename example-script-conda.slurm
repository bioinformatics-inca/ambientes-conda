#!/usr/bin/env bash
#
#SBATCH --job-name=fastqcConda
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH -o CondaFastQC-%j.out

###############################################################################################
### example-script-conda.slurm
### Nicole Schrerer - 16-01-2024
### example fastQC script using conda environment
### sbatch SCRIPT.slurm FASTQFILENAME
###############################################################################################

### print date and node name in the output
date; hostname ; echo

### Variable $FASTQ receives the first argument from the command
FASTQ=$1

### Define a variable for the number of threads being the number of cores requested for SLURM 
THREADS=$SLURM_CPUS_PER_TASK

### Register this values in the output
echo "### executing FastQC for sample $FASTQ in  $SLURM_CPUS_PER_TASK threads "; echo

### load the necessary modules
module load miniconda3

### load the configurations for the conda environment
eval "$(conda shell.bash hook)"

conda activate /ENDERECO-DO-SEU-PROJETO/lib/conda_envs/meuenvironment

### register in the output the location of the executable
which fastqc

echo

### write the command in a variable (it is a good practice - not mandatory)
command=" fastqc -t $THREADS $FASTQ "

### register the command in the output - it is good for debug
echo "### executing: $command "
echo 

### execute the command stored in this variable (the command 'time' is used to register the timing statistics about this program run)
time $command   

### deactivate the conda environment
conda deactivate

### unload miniconda
module unload miniconda3

### print the date and go out
date; echo
exit
