#!/usr/bin/env bash

for dir in `ls -1`; do
  if [[ -d $dir ]]; then
      echo $dir
      cd $dir && vagrant status
      cd /home/rforth/vagrant/
  fi
done
