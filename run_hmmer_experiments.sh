#!/bin/bash

# Διαμόρφωση των μεταβλητών για την προσομοίωση gem5
l1_icache_sizes=("32kB")                   # Μεγέθη L1 Instruction Cache
l1_dcache_sizes=("32kB" "64kB")            # Μεγέθη L1 Data Cache
l2_cache_sizes=("4MB")                      # Μεγέθη L2 Cache
l1_icache_associativities=("2" "4")         # Συνδεσιμότητα L1 Instruction Cache
l1_dcache_associativities=("2" "4" "8")     # Συνδεσιμότητα L1 Data Cache
l2_cache_associativities=("8")               # Συνδεσιμότητα L2 Cache
cache_line_sizes=("64" "128")               # Μέγεθος γραμμής Cache (προεπιλογή και μεγαλύτερο)

max_instructions="100000000"                # Μέγιστος αριθμός εντολών
benchmark="spec_cpu2006/456.hmmer/src/spechmmer"   # Benchmark εκτέλεσης
input_file="spec_cpu2006/456.hmmer/data/bombesin.hmm"   # Αρχείο εισόδου

# Βρόχοι για την εκτέλεση των διαφορετικών παραμέτρων
for l1_icache in "${l1_icache_sizes[@]}"; do
  for l1_dcache in "${l1_dcache_sizes[@]}"; do
    for l2_cache in "${l2_cache_sizes[@]}"; do
      for l1i_assoc in "${l1_icache_associativities[@]}"; do
        for l1d_assoc in "${l1_dcache_associativities[@]}"; do
          for l2_assoc in "${l2_cache_associativities[@]}"; do
            for cache_line_size in "${cache_line_sizes[@]}"; do
              output_dir="spec_results/hmmer5/${l1_icache}_${l1_dcache}_${l2_cache}_${l1i_assoc}_${l1d_assoc}_${l2_assoc}_${cache_line_size}"
              mkdir -p "$output_dir"

              # Εκτέλεση του gem5 με τις αντίστοιχες παραμέτρους
              ./build/ARM/gem5.opt -d "$output_dir" configs/example/se.py \
                --cpu-type=MinorCPU --caches --l2cache \
                --l1i_size="$l1_icache" --l1d_size="$l1_dcache" \
                --l2_size="$l2_cache" --l1i_assoc="$l1i_assoc" \
                --l1d_assoc="$l1d_assoc" --l2_assoc="$l2_assoc" \
                --cacheline_size="$cache_line_size" \
                -c "$benchmark" -o "--fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 $input_file" -I "$max_instructions"
            done
          done
        done
      done
    done
  done
done
