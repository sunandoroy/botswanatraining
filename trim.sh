#!/bin/bash


RES=$(pwd)
find $RES -type d > dirlist
sed -i '1d' dirlist

cat dirlist | while read subf
do


echo $subf
trim_galore $subf/*.gz -q 30 --phred33 -o $subf/ --illumina -max_n 2 --paired 
fastqc -q $subf/*.gz -o $subf/



done

