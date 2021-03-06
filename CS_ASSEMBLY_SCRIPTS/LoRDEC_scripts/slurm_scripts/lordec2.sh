#!/bin/bash
#####Number of nodes
#SBATCH -N1
#########Number of tasks per node
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
##########
#SBATCH --job-name=deBruijn
#SBATCH --workdir=./
######SBATCH --workdir=./
#SBATCH -o ./deBruijn2_out.txt 
#SBATCH -e ./deBruijn2_err.txt 
#SBATCH --mail-user=debojyoti.das@und.edu
#SBATCH --mail-type=ALL

start_time=$(date +%s)

echo "Initial time " $start_time

export PATH=$PATH:/home/debojyoti.das/DE_NOVO_ASSEMBLY/LoRDEC-0.5.3-Linux/bin

ILLUMINA_DATA_DIR1=/home/debojyoti.das/DENOVO_ASSEMBLY_ALLPATHS/snapping_turtle/data/frag_lib
ILLUMINA_DATA_DIR2=/home/debojyoti.das/DENOVO_ASSEMBLY_ALLPATHS/snapping_turtle/data/jump_lib1
ILLUMINA_DATA_DIR3=/home/debojyoti.das/DENOVO_ASSEMBLY_ALLPATHS/snapping_turtle/data/jump_lib2

lordec-build-SR-graph -T 8 -m 62000 -a 100000 -2 $ILLUMINA_DATA_DIR1/13482X1_161222_D00294_0282_BCAB4VANXX_7_1_val_1.fq.gz,$ILLUMINA_DATA_DIR1/13482X1_161222_D00294_0282_BCAB4VANXX_7_2_val_2.fq.gz,$ILLUMINA_DATA_DIR2/13482X2_161222_D00294_0282_BCAB4VANXX_7_1_val_1.fq.gz,$ILLUMINA_DATA_DIR2/13482X2_161222_D00294_0282_BCAB4VANXX_7_2_val_2.fq.gz,$ILLUMINA_DATA_DIR3/13482X3_161222_D00294_0282_BCAB4VANXX_7_1_val_1.fq.gz,$ILLUMINA_DATA_DIR3/13482X3_161222_D00294_0282_BCAB4VANXX_7_2_val_2.fq.gz,$ILLUMINA_DATA_DIR1/13482X1_170227_D00550_0410_BCADT6ANXX_1_1_val_1.fq.gz,$ILLUMINA_DATA_DIR1/13482X1_170227_D00550_0410_BCADT6ANXX_1_2_val_2.fq.gz,$ILLUMINA_DATA_DIR1/13482X1_170110_D00550_0402_BCADTFANXX_8_1_val_1.fq.gz,$ILLUMINA_DATA_DIR1/13482X1_170110_D00550_0402_BCADTFANXX_8_2_val_2.fq.gz -k 19 -s 3 -g illumina_19_3.h5


#DATA_DIR=/home/debojyoti.das/PACBIO/PACBIO_RAW
#DBG_DIR=/home/debojyoti.das/pacbio_correction

#for q in `seq 1 6`; do lordec-correct -T 8 -m 62000 -a 100000 -i $DATA_DIR/subreads$q.fastq.gz -2 $DBG_DIR/illumina_19_3 -k 19 -s 3 -o corrected_19_3_subreads$q.fasta; done

stop_time=$(date +%s)

echo "Final time " $stop_time

execution_time=$(expr $stop_time - $start_time)

echo -e "Execution time " $execution_time " seconds \n "
echo -e "\t \t" $(($execution_time/60)) " minutes \n"
echo -e "\t \t" $(($execution_time/3600)) " hours \n"
