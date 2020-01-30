#!/bin/bash

#data atual no formato YYYY-MM-DD
filedate=`date "+%F"`


## FIX PAR ##############################
SPADESDIR='/home/user/tools/SPAdes-3.13.0-Linux'

## INPUT PAR ############################
#nome do PROJECT
PROJECT=$1

samples=$PROJECT'_sample.txt'

memory=$2
#########################################
echo 'Check par...'
# chk output
dir=${PROJECT}/'fastq/subset/assembly'
if ! [ -d ${dir} ]
then
     mkdir ${dir}
fi

echo 'spades assembly...'
# spades

while IFS= read -r line
do
	mkdir ${PROJECT}/'fastq/subset/assembly/'${line}
	${SPADESDIR}'/bin/spades.py' --plasmid --pe1-1 ${PROJECT}/'fastq/subset/'${line}'_L001_R1_001.fastq.gz' --pe1-2 ${PROJECT}/'fastq/subset/'${line}'_L001_R2_001.fastq.gz' -o ${PROJECT}/'fastq/subset/assembly/'${line} --memory ${memory}
done <"$samples"

echo 'DONE '${PROJECT}
