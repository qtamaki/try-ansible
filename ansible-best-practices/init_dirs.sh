#!/bin/bash

if [[ ! $1 ]];then
  echo "no dir prefix!"
  exit  1
fi

ansible-playbook -i hosts.ansible ansible-best-practices.yml --extra-vars "path_prefix=$1"

