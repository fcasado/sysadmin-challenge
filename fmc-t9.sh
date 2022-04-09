#!/bin/bash
# coding: utf-8
# 20220409 fmc - Sysadmin Challenge Q9

# Main variables
OUTPUT_FILE=/tmp/output_1.txt
INPUT_FILE=$1
ERR_LACK_ARGU=33

# Argument checker
if [ -z "$1"  ]
then
	echo -e "Usage: ./fmc-t9.sh <CONTROL_FILE_TXT>\n"
	exit $ERR_LACK_ARGU
fi	

# TODO: Must validade premisses if needed IP valid test



# Clean output results 
: > $OUTPUT_FILE

declare -a addr_list=$(cat $INPUT_FILE | cut -d" " -f1 | uniq)


for ip in ${addr_list[@]}
do
	grep $ip $INPUT_FILE | head -1 >> $OUTPUT_FILE
done
