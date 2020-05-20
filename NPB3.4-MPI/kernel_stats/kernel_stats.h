#ifndef STOP_EARLY_H
#define STOP_EARLY_H

#include <mpi.h>
#include <sys/time.h>
#include <stdio.h>
#include <inttypes.h>
#include <stdlib.h>

#define STOP_IN 5
#define PRINT_INIT 1
#define PRINT_STATS 2

typedef enum {false, true} bool;

unsigned int current_iteration;
double init_time;
double begin_time;
bool early_stop = false;

double get_current_time();
int get_iteration_();
void init_timestep_();
void end_timestep_();
void begin_timestep_();

#endif

