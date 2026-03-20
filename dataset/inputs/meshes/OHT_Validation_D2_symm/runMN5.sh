#!/bin/bash
#
#  Submit jobs in MN5
#     sbatch < job.sh
#
#SBATCH --job-name=oht
#SBATCH --chdir=.
#SBATCH --error=%j.err
#SBATCH --output=%j.out
#SBATCH --account=bsc21
#SBATCH --qos=gp_bsccase
#SBATCH --ntasks=14
#SBATCH --time=00:10:00
#
# Load modules for the executable
#
# GCC
module purge
module load gcc/13.2.0 openmpi/4.1.5-gcc

# Intel

#ALYAPATH="/gpfs/projects/bsce81/alya/builds/Alya_mn5gccv2.x"
ALYAPATH="/gpfs/projects/bsce81/alya/tests/UDG/experiment-sensitivy-example/alya/Alya_mn5gccv2.x"
PROBLEMNAME=OHT_Validation_D2_symm 
#
# Launches ALYA
#
srun $ALYAPATH $PROBLEMNAME
