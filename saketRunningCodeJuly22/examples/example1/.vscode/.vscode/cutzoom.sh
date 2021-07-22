#!/bin/bash
cd ./partitioned/${IPCMODE}

for i in $ENCLAVES
do
    PROG=$i make -f ../../.vscode/Makefile.cutzoom realclean
    PROG=$i make -f ../../.vscode/Makefile.cutzoom dot
done

make -f ../../.vscode/Makefile.cutzoom capotags

for i in $ENCLAVES
do
    PROG=$i make -f ../../.vscode/Makefile.cutzoom clean
done

cd ../../

