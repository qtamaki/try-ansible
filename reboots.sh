#!/bin/bash

for i in `seq 2 10`
do

server=app@192.168.22.$(($i + 129))
ssh -t $server "sudo reboot"

done


