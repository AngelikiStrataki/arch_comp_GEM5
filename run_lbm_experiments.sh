#!/bin/bash

# Διαμόρφωση των μεταβλητών (Configuration of variables)
l1_icache_sizes=("32kB")                   # L1 Instruction Cache Sizes
l1_dcache_sizes=("64kB" "128kB")           # L1 Data Cache Sizes
l2_cache_sizes=("4MB")                     # L2 Cache Sizes
l1_icache_associativities=("2" "4")        # L1 Instruction Cache Associativities
l1_dcache_associativities=("4" "8")        # L1 Data Cache Associativities
l2_cache_associativities=("8")             # L2 Cache Associativity
cache_line_sizes=("64" "128")              # Cache Line Sizes

# Φάκελος αποθήκευσης των αποτελεσμάτων (Results directory)
output_dir="spec_results/speclibm"

# Δημιουργία φακέλου αν δεν υπάρχει (Create directory if it doesn't exist)
mkdir -p $output_dir

# Βασικές παράμετροι προσομοίωσης (Basic gem5 simulation parameters)
gem5_exec="./build/ARM/gem5.opt"            # Path to gem5 executable
gem5_script="configs/example/se.py"        # Path to gem5 configuration script
benchmark="spec_cpu2006/470.lbm/src/speclibm"  # Benchmark executable
input_args="20 spec_cpu2006/470.lbm/data/lbm.in 0 1 spec_cpu2006/470.lbm/data/100_100_130_cf_a.of"  # Benchmark input
instruction_limit="100000000"              # Maximum number of instructions

# Επανάληψη για όλους τους συνδυασμούς (Loop through all combinations)
for l1_icache in "${l1_icache_sizes[@]}"; do
  for l1_dcache in "${l1_dcache_sizes[@]}"; do
    for l2_cache in "${l2_cache_sizes[@]}"; do
      for l1_icache_assoc in "${l1_icache_associativities[@]}"; do
        for l1_dcache_assoc in "${l1_dcache_associativities[@]}"; do
          for l2_cache_assoc in "${l2_cache_associativities[@]}"; do
            for cache_line_size in "${cache_line_sizes[@]}"; do
              
              # Καθορισμός ονόματος φακέλου αποτελεσμάτων (Define result directory name)
              config_name="l1i_${l1_icache}_l1d_${l1_dcache}_l2_${l2_cache}_l1i_assoc_${l1_icache_assoc}_l1d_assoc_${l1_dcache_assoc}_l2_assoc_${l2_cache_assoc}_line_${cache_line_size}"
              result_dir=spec_results/lbm6/"$config_name"
              
              # Δημιουργία φακέλου για τον συγκεκριμένο συνδυασμό (Create directory for this combination)
              mkdir -p "$result_dir"
              
              # Εκτέλεση της εντολής gem5 (Run gem5 simulation)
              $gem5_exec -d "$result_dir" \
                $gem5_script \
                --cpu-type=MinorCPU \
                --caches \
                --l2cache \
                --l1i_size=$l1_icache \
                --l1d_size=$l1_dcache \
                --l2_size=$l2_cache \
                --l1i_assoc=$l1_icache_assoc \
                --l1d_assoc=$l1_dcache_assoc \
                --l2_assoc=$l2_cache_assoc \
                --cacheline_size=$cache_line_size \
                -c $benchmark \
                -o "$input_args" \
                -I $instruction_limit
              
              echo "Completed: $config_name"  # Εκτύπωση ολοκλήρωσης (Print completion message)
            done
          done
        done
      done
    done
  done
done
