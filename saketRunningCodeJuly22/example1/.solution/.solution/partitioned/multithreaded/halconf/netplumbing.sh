#!/bin/bash
ip link set dev orgin down > /dev/null 2>&1 
ip link set dev prpin down > /dev/null 2>&1
ip link delete orgin > /dev/null 2>&1
ip link delete prpin > /dev/null 2>&1

ip tuntap add mode tap orgin
ip tuntap add mode tap prpin

ip link set dev orgin up
ip link set dev prpin up

ip addr add 10.71.0.1/24 dev orgin
ip addr add 10.72.0.1/24 dev prpin



