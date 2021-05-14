#!/bin/bash
cd emu/scripts/install/
./install-deps.sh
cd ../qemu/
./qemu-build-vm-images.sh -a amd64 -d eoan -k eoan -s 20G -o /IMAGES
./qemu-build-vm-images.sh -a amd64 -d eoan -k eoan -s 20G -o /IMAGES -u
sudo service core-daemon start
cd ../../../
cd capo/partitioner/src
git checkout 264edc821de77ad313b80b6d2a61c823d793b2fb
make
cd ../example/
cp example_files/* .
sed -i '21s#.*#\t../../../mules/cle-preprocessor/src/qd_cle_preprocessor.py -f $^#' Makefile
sed -i '34s#-lpartitioner#partitioner.o#' Makefile
sed -i '36s#-lpartitioner#partitioner.o#' Makefile
sed -i '9s#256#128#' targeting.h
cp ../src/partitioner.o .
make PROG=ex1 ex1
make PROG=ex1 ex1.mod.c
make PROG=ex1 ex1.mod.bc
make PROG=ex1 dot
python3 ../src/partitioner.py ex1
cp ex1_step2.mod.c ex1.mod.c
make PROG=ex1 dot 
python3 ../src/partitioner.py ex1
make PROG=ex1 ex1_parts
tar -czvf orange-enclave-gw-P.tar ex1_orange
tar -czvf purple-enclave-gw-O.tar ex1_purple boats.jpg
mkdir ../../../emu/.apps
mv orange-enclave-gw-P.tar ../../../emu/.apps/
mv purple-enclave-gw-O.tar ../../../emu/.apps/
cd ../../../emu/
git checkout 1d81e85fe8d3e078527a5eec8b1ae494a3b31f4f
xhost +
rm -rf .snapshots/ .imnfiles/ .deprecated/ 
#./start.sh 2






