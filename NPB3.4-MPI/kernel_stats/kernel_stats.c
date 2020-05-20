#include "kernel_stats.h"

double get_current_time() {
    struct timeval tp;
    struct timezone tzp;
    gettimeofday(&tp,&tzp);
    return ((double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
}

void print_timestep(uint8_t type, double collected_time) {
  int rank;

  MPI_Comm_rank(MPI_COMM_WORLD, &rank);

  if(rank == 0)
    switch(type) {
      case PRINT_INIT:
        printf("Init time,%f\n", collected_time - init_time);
        break;
      case PRINT_STATS:
        printf("Iteration,%i,%f,%f\n", current_iteration, collected_time - init_time, collected_time - begin_time);
    }
}

void init_timestep_() {
  current_iteration = 0;
  init_time = get_current_time();
}

void end_timestep_() {
  double end_time = get_current_time();

  print_timestep(PRINT_STATS, end_time);

  if(early_stop && current_iteration == STOP_IN)
    MPI_Abort(MPI_COMM_WORLD, 0);
}

void begin_timestep_() {
  if(current_iteration == 0) {
    double current_time = get_current_time();
    print_timestep(PRINT_INIT, current_time);
  }

  current_iteration++;
  begin_time = get_current_time();
}

int get_iteration_() {
  return current_iteration;
}

