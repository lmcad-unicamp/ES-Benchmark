#!/bin/bash

mkdir ../bin
cd ../kernel_stats
make
cd ..
for p in cg ep is mg ft; do
  for c in A C; do
    make $p CLASS=$c
  done
done
