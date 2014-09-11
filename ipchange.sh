#!/bin/bash

for i in `seq 2 10`
do

server=app@192.168.22.$(($i + 129))

ssh $server "cat > interfaces <<EOS
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto eth0
iface eth0 inet static
    address 192.168.22.$(($i + 50))
    network 192.168.22.0
    netmask 255.255.255.0
    broadcast 192.168.22.255
    gateway 192.168.22.1
EOS
"
n=$(printf "%.2d" $i)
ssh -t $server "sudo mv interfaces /etc/network && sudo sed -i -e 's/U1404x01/U1404x${n}/g' /etc/hostname && sudo sed -i -e 's/U1404x01/U1404x${n}/g' /etc/hosts"

done


