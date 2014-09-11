#!/bin/bash

for i in `seq 1 10`
do
  server=app@192.168.22.$(($i + 50))
  (
    cd
    scp -pr .ssh $server:~
  )
done


