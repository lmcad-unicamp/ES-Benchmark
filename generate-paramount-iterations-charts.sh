# Generate a CSV file with information about the paramount iteration.
# Each line has:
# VM type,# of machines,VM instance info,benchmark name.inputclass,Iteration, iteration #, cumulative execution time, iteration execution time.

grep  "Iteration," paramount-results/*/*.out | sed "s~paramount-results/~~g" | sed "s~/NAS-~,~g" | sed "s~-i-~,~g" | sed "s~-run_~,~g" | sed "s~.X.out:~,~g" > iteration-times.csv

mkdir -p "./paramount-iterations-charts"

python3 plot-paramount-iterations.py
