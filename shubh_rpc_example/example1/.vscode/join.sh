#!/bin/bash

ODIR=$1
OUTFILE=$2
INFILES=`find $ODIR -name *.[ch]`
join_clemaps $OUTFILE $INFILES
