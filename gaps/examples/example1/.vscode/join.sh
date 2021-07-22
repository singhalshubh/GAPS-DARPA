#!/bin/bash

ODIR=$1
OUTFILE=$2
INFILES=`find $ODIR -name *.[ch]`
python3 /opt/closure/scripts/join_clemaps.py $OUTFILE $INFILES
