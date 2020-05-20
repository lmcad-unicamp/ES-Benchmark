#!/bin/bash

/usr/bin/time -o CG-A-TIME.out -p  mpirun -n 2 ../bin/cg.A.x 1> CG-A.out 2> CG-A.err
/usr/bin/time -o CG-B-TIME.out -p  mpirun -n 2 ../bin/cg.B.x 1> CG-B.out 2> CG-B.err
/usr/bin/time -o CG-C-TIME.out -p  mpirun -n 2 ../bin/cg.C.x 1> CG-C.out 2> CG-C.err
#/usr/bin/time -o CG-D-TIME.out -p  mpirun -n 2 ../bin/cg.D.x 1> CG-D.out 2> CG-D.err
