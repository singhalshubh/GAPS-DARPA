#!/bin/bash

#install git,python and git slave on a fresh OS
sudo apt-get install git python nodejs -y
set -ex
wget https://sourceforge.net/projects/gitslave/files/gitslave-2.0.2.tar.gz
tar -xzvf gitslave-2.0.2.tar.gz
cd gitslave-2.0.2
sed 's/pod2man/pod2man --name gits/' -i Makefile
sed 's/pod2man/pod2man --name gits-checkup/' -i contrib/Makefile
make
sudo make install
cd /usr/local/bin/
sudo sed -i '1018s#$stashes.*#$stashes =~ s/^(stash\\@\\{\\d+\\}: )WIP( on .*: [\\da-f]+)\\.\\.\\..*$/${1}Work-in-Progress${2}/mg;#' gits

##Update SSH files
cd /etc/ssh/
echo 'Editing ssh_config'
sudo sed -i 's/#   ForwardAgent .*/    ForwardAgent yes/' ssh_config
sudo sed -i 's/#   ForwardX11 .*/    ForwardX11 yes/' ssh_config
sudo sed -i 's/#   ForwardX11Trusted .*/    ForwardX11Trusted yes/' ssh_config

#Build Closure and navigate to src
cd ~
mkdir closure
cd closure
gits clone https://github.com/gaps-closure/build
cd build
./build.sh
cd src

cp ../../../demo.sh .
./demo.sh
sudo apt-get install libconfig-dev libzmq3-dev -y
make -C hal/
export PATH=$PATH:${HOME}'/.local/bin'
pip install hpp2plantuml
pip install sympy
pip install hpp2plantuml
pip install  sympy

