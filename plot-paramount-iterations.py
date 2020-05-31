

import csv


def read_input_file(input_filename):

    ds = {}
    with open(input_filename, newline='') as csvfile:
        ifh = csv.reader(csvfile, delimiter=',', quotechar='|')
        for row in ifh:
            if len(row) == 8: # Parse only complete lines
                vm_type = row[0] # VM type
                cfg_sz = row[1] # number of machines
                benchmark = row[3]
                iter_n = row[5] # Iteration number
                iter_time = row[7]
                if benchmark not in ds:
                    ds[benchmark] = {}
                if cfg_sz not in ds[benchmark]:
                    ds[benchmark][cfg_sz] = {} 
                if vm_type not in ds[benchmark][cfg_sz]:
                    ds[benchmark][cfg_sz][vm_type] = {}

                ds[benchmark][cfg_sz][vm_type][iter_n] = float(iter_time)
    return ds

import matplotlib
import matplotlib.pyplot as plt
import numpy as np
def plot_PI_graphics(benchmark, cfg_sz, cfg_results, output_dir):
    # cfg_results = dic[vm_type][iter_n] -> iteration execution time
    # Results will be ploted as a function of iter_n, hence, we need to generate a dictionary indexed by iter_n
    it_idx = []
    for vm_type, its in cfg_results.items():
        for itn, it_time in its.items():
            if itn not in it_idx:
                it_idx.append(itn)

    its_dic = {}
    min_time = {}
    for vm_type, its in cfg_results.items():
        if len(it_idx) == len(its): # Ignore invalide results (TODO: This is not the proper way of doing this) 
            for itn, it_time in its.items():
                if itn not in its_dic:
                    its_dic[itn] = {}
                    min_time[itn] = it_time
                its_dic[itn][vm_type] = it_time
                min_time[itn] = min(it_time,min_time[itn])


    # Data for plotting
    it_idx.sort()
    print(it_idx)
    
    # For each configuration type, plot its relative performance for each iteration
    fig_rel, ax_rel = plt.subplots()
    fig_abs, ax_abs = plt.subplots()
    for vm_type, its in cfg_results.items():
        if len(it_idx) == len(its): # Ignore invalide results (TODO: This is not the proper way of doing this) 
            y_relative_datapoints = []
            y_absolute_datapoints = []
            print(benchmark,cfg_sz,vm_type,":",its)
            for it_i in it_idx:
                y_relative_datapoints.append(its[it_i]/min_time[it_i])
                y_absolute_datapoints.append(its[it_i])
            #print(y_datapoints)
            ax_rel.plot(it_idx,y_relative_datapoints,label=vm_type)
            ax_abs.plot(it_idx,y_absolute_datapoints,label=vm_type)
    ax_rel.set(xlabel='iteration #', ylabel='relative performance (slowdown)',
           title='Relative performance: {} - {}'.format(benchmark,cfg_sz))
    ax_abs.set(xlabel='iteration #', ylabel='execution time (s)',
           title='Execution time: {} - {}'.format(benchmark,cfg_sz))
    ax_rel.grid()
    ax_abs.grid()
    box = ax_rel.get_position()
    ax_rel.set_position([box.x0, box.y0, box.width * 0.8, box.height])
    box = ax_abs.get_position()
    ax_abs.set_position([box.x0, box.y0, box.width * 0.8, box.height])
    ax_rel.legend(loc='center left', bbox_to_anchor=(1, 0.5),fontsize=8)
    ax_abs.legend(loc='center left', bbox_to_anchor=(1, 0.5),fontsize=8)
    fig_rel.savefig("{}/{}{}-relative-cfgs-performance.png".format(output_dir,benchmark,cfg_sz))
    fig_abs.savefig("{}/{}{}-absolute-cfgs-performance.png".format(output_dir,benchmark,cfg_sz))
    plt.close(fig_rel)
    plt.close(fig_abs)

        
        
    
        
    
def main():
    output_dir = "paramount-iterations-charts"
    input_filename = "iteration-times.csv"

    dataset = read_input_file(input_filename)
    for benchmark, bresults in dataset.items():
        print("Processing results for benchmark: {}".format(benchmark))
        for cfg_sz, cfg_results in bresults.items():
            print(" - Processing results for configuration size: {}".format(cfg_sz))
            plot_PI_graphics(benchmark, cfg_sz, cfg_results, output_dir)


    
if __name__ == "__main__":
    main()

    
