#!/bin/bash

cd paramount-results
for i in $(ls); do
  for m in CG MG EP IS FT; do
    for t in C D E; do
      for s in 1 2 4 8 16 32; do
        echo -en "$i\t$m\t$t\t$s\t";
        FILE=$(ls $i/NAS-${s}x-*_$m.$t.X.out 2> /dev/null)
        if [ -f "$FILE" ]; then
          tmp=$(cat $FILE | grep "ERROR: number of processes")
          if [[ -z "$tmp" ]]; then
            tmp=$(cat $FILE | grep "is not a power of two")
            if [[ -z "$tmp" ]]; then
              tmp1=$(cat $FILE | grep "signal 9 (Killed)")
              tmp2=$(cat $FILE | grep "Error encountered in allocating space")
              if [[ -z "$tmp1" ]] && [[ -z "$tmp2" ]]; then
                tmp=$(cat $FILE | grep "SIGSEGV")
                if [[ -z "$tmp" ]]; then
                  tmp=$(cat $FILE | grep "unexpectedly disconnected")
                  tmp1=$(cat $FILE | grep "Connection refused")
                  if [[ -z "$tmp" ]] && [[ -z $tmp1 ]] && [[ -z $tmp2 ]]; then
                    tmp=$(cat $FILE | grep "integer overflow")
                    if [[ -z "$tmp" ]]; then
                      cat $i/NAS-${s}x-*_$m.$t.X.out 2> /dev/null | grep "Iteration," | cut -d, -f4 | awk '{sum+=$1;N+=1} END {print sum/N}';
                    else
                      echo "ERROROVER"
                    fi
                  else
                    echo "ERRORNET"
                  fi
                else
                  echo "ERRORSEG"
                fi
              else
                 echo "ERRORMEM"
              fi
            else
              echo "ERRORPOW"
            fi
          else
            echo "ERRORNUM";
          fi;
        else
          echo "DONOTEXIST"
        fi
      done;
    done;
  done;
done;
cd ..
