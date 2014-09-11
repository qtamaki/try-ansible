#!/bin/bash

for i in `seq 1 10`
do
  server=app@192.168.22.$(($i + 50))
  ssh -t $server "sudo cp -a .ssh /root/;sudo chown -R root:root /root/.ssh"
done


