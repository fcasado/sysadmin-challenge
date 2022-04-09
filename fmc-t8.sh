#!/bin/bash
# coding: utf-8
# 20220402 fmc - Sysadmin Challenge Q8
# Observation: All ssh connections are made using a same key without passphrase|password 
#              for this ssh not has more elaborated credentials.

# Main variables
ACCOUNT=myuser
OUTPUT_FILE=servers_version.txt
INPUT_FILE=$(cat $1)
#INPUT_FILE=$1
ERR_LACK_ARGU=33

# Argument checker
if [ -z "$1"  ]
then
	echo -e "Usage: ./fmc-t8.sh <SERVERS-LIST-TXT-FILE>\n"
	exit $ERR_LACK_ARGU
fi	

# Clean results
: > $OUTPUT_FILE

# Iterate throught the servers list could be slowly and must be improved with more time.
for line in $INPUT_FILE
do
	HOST_DATE=$(ssh $ACCOUNT@$line "date +'%H:%M:%S %D'")
	HOST_SERVER_NAME=$(ssh $ACCOUNT@$line "hostname")
	HOST_SERVER_IP=$(ssh $ACCOUNT@$line "ip route get 1 | head -1 | cut -d' ' -f7")
	HOST_SERVER_VERSION=$(ssh $ACCOUNT@$line "uname -srvo")
	echo -e "$HOST_DATE $HOST_SERVER_NAME $HOST_SERVER_IP $HOST_SERVER_VERSION" >> $OUTPUT_FILE 
done
