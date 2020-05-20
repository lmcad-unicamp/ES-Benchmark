c CLASS = E
c  
c  
c  This file is generated automatically by the setparams utility.
c  It sets the number of processors and the class of the NPB
c  in this directory. Do not modify it by hand.
c  
        integer            na, nonzer, niter
        double precision   shift, rcond
        parameter(  na=9000000,
     >              nonzer=26,
     >              niter=100,
     >              shift=1.5d3,
     >              rcond=1.0d-1 )
        logical  convertdouble
        parameter (convertdouble = .false.)
        character*11 compiletime
        parameter (compiletime='20 May 2020')
        character*3 npbversion
        parameter (npbversion='3.4')
        character*6 cs1
        parameter (cs1='mpif90')
        character*8 cs2
        parameter (cs2='$(MPIFC)')
        character*6 cs3
        parameter (cs3='(none)')
        character*6 cs4
        parameter (cs4='(none)')
        character*3 cs5
        parameter (cs5='-O3')
        character*43 cs6
        parameter (cs6='$(FFLAGS) -O ../kernel_stats/kernel_stats.o')
        character*6 cs7
        parameter (cs7='randi8')
