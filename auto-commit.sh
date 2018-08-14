#!/bin/bash

function random_range() {
  local beg=$1
  local end=$2
  echo $(($(od -An -N2 -i /dev/random) % ($end - $beg) + $beg))
}

for i in {1..5}; do
  rand_num=$(random_range 1 65535)
  echo $rand_num >> README.md
  git commit -a -m "$* $rand_num"
done
