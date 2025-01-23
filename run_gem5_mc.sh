#!/bin/bash

# L1 Instruction Cache Sizes
l1_icache_sizes=("32kB" "64kB")

# L1 Data Cache Sizes
l1_dcache_sizes=("64kB" "128kB")

# L2 Cache Sizes
l2_cache_sizes=("4MB")

# L1 Instruction Cache Associativity
l1_icache_associativities=("2" "4")

# L1 Data Cache Associativity
l1_dcache_associativities=("4" "8")

# L2 Cache Associativity
l2_cache_associativities=("8")

# Cache Line Sizes
cache_line_sizes=("64" "32")

# Maximum Instructions to simulate
max_instructions="200000000"

# Benchmark binary and input file
benchmark="spec_cpu2006/429.mcf/src/specmcf"
input_file="spec_cpu2006/429.mcf/data/inp.in"

# Iterate over all cache configurations
for l1_icache in "${l1_icache_sizes[@]}"; do
  for l1_dcache in "${l1_dcache_sizes[@]}"; do
    for l2_cache in "${l2_cache_sizes[@]}"; do
      for l1i_assoc in "${l1_icache_associativities[@]}"; do
        for l1d_assoc in "${l1_dcache_associativities[@]}"; do
          for l2_assoc in "${l2_cache_associativities[@]}"; do
            for line_size in "${cache_line_sizes[@]}"; do
              output_dir="spec_results/mcf5/${l1_icache}_${l1_dcache}_${l2_cache}_${l1i_assoc}_${l1d_assoc}_${l2_assoc}_${line_size}"
              mkdir -p "$output_dir"

              # Run gem5 simulation
              ./build/ARM/gem5.opt -d "$output_dir" configs/example/se.py \
                --cpu-type=MinorCPU --caches --l2cache \
                --l1i_size="$l1_icache" --l1d_size="$l1_dcache" \
                --l2_size="$l2_cache" --l1i_assoc="$l1i_assoc" \
                --l1d_assoc="$l1d_assoc" --l2_assoc="$l2_assoc" \
                --cacheline_size="$line_size" \
                -c "$benchmark" -o "$input_file" -I "$max_instructions"
            done
          done
        done
      done
    done
  done
done
