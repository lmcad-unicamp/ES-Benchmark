c CLASS = S
c  
c  
c  This file is generated automatically by the setparams utility.
c  It sets the number of processors and the class of the NPB
c  in this directory. Do not modify it by hand.
c  

c full problem size
        integer isiz01, isiz02, isiz03
        parameter (isiz01=12, isiz02=12, isiz03=12)

c number of iterations and how often to print the norm
        integer itmax_default, inorm_default
        parameter (itmax_default=50, inorm_default=50)
        double precision dt_default
        parameter (dt_default = 0.5d0)
        logical  convertdouble
        parameter (convertdouble = .false.)
        character*11 compiletime
        parameter (compiletime='19 May 2020')
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
        character*9 cs6
        parameter (cs6='$(FFLAGS)')
        character*6 cs7
        parameter (cs7='randi8')
