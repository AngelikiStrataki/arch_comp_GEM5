#!/bin/bash

# L1 Instruction Cache Sizes
l1_icache_sizes=("32kB")
# L1 Data Cache Sizes
l1_dcache_sizes=("64kB" "32kB")
# L2 Cache Sizes
l2_cache_sizes=("4MB")
# L1 Instruction Cache Associativity
l1_icache_associativities=("2" "4")
# L1 Data Cache Associativity
l1_dcache_associativities=("4" "8")
# L2 Cache Associativity
l2_cache_associativities=("8")
# Cache Line Sizes
cache_line_sizes=("64" "128")

# Loop through all cache configurations
for l1i_size in "${l1_icache_sizes[@]}"; do
  for l1i_assoc in "${l1_icache_associativities[@]}"; do
    for l1d_size in "${l1_dcache_sizes[@]}"; do
      for l1d_assoc in "${l1_dcache_associativities[@]}"; do
        for l2_size in "${l2_cache_sizes[@]}"; do
          for l2_assoc in "${l2_cache_associativities[@]}"; do
            for line_size in "${cache_line_sizes[@]}"; do
              # Define output directory based on parameters
              output_dir="spec_results/bzip5/l1i_${l1i_size}_assoc${l1i_assoc}_l1d_${l1d_size}_assoc${l1d_assoc}_l2_${l2_size}_assoc${l2_assoc}_line${line_size}"
              mkdir -p "$output_dir"  # Create the directory if it doesn't exist
              
              # Execute gem5 with the specified configuration
              ./build/ARM/gem5.opt -d "$output_dir" \
                configs/example/se.py \
                --cpu-type=MinorCPU --caches --l2cache \
                --l1i_size="$l1i_size" --l1i_assoc="$l1i_assoc" \
                --l1d_size="$l1d_size" --l1d_assoc="$l1d_assoc" \
                --l2_size="$l2_size" --l2_assoc="$l2_assoc" \
                --cacheline_size="$line_size" \
                -c spec_cpu2006/401.bzip2/src/specbzip \
                -o "spec_cpu2006/401.bzip2/data/input.program 10" \
                -I 100000000
            done
          done
        done
      done
    done
  done
done
