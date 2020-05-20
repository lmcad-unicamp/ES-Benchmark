#!/bin/bash

mkdir -p results
cd results

size='C'
threads=4

timeout 120 /usr/bin/time -o ep-$size-TIME-$threads.out -p  mpirun -n $threads ../bin/ep.$size.x 1> ep-$size.$threads.out 2> ep-$size.$threads.err
timeout 120 /usr/bin/time -o is-$size-TIME-$threads.out -p  mpirun -n $threads ../bin/is.$size.x 1> is-$size.$threads.out 2> is-$size.$threads.err
timeout 120 /usr/bin/time -o mg-$size-TIME-$threads.out -p  mpirun -n $threads ../bin/mg.$size.x 1> mg-$size.$threads.out 2> mg-$size.$threads.err
timeout 120 /usr/bin/time -o ft-$size-TIME-$threads.out -p  mpirun -n $threads ../bin/ft.$size.x 1> ft-$size.$threads.out 2> ft-$size.$threads.err
timeout 120 /usr/bin/time -o cg-$size-TIME-$threads.out -p  mpirun -n $threads ../bin/cg.$size.x 1> cg-$size.$threads.out 2> cg-$size.$threads.err
