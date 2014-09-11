#!/bin/bash

for i in `seq 1 10`
do

server=root@192.168.22.$(($i + 50))

ssh $server "cat > /etc/network/interfaces <<EOS
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
    dns-nameservers 192.168.22.1 8.8.8.8
EOS
"
done


