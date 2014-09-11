#!/bin/bash

for i in `seq 1 10`
do

server=root@192.168.22.$(($i + 50))
ssh -t $server "reboot"

done


