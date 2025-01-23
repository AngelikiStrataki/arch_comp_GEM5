#!/bin/bash

# Μεγέθη των L1 Instruction Cache
l1_icache_sizes=("32kB")

# Μεγέθη των L1 Data Cache
l1_dcache_sizes=("64kB" "128kB")

# Μεγέθη της L2 Cache
l2_cache_sizes=("4MB")

# Associativity της L1 Instruction Cache
l1_icache_associativities=("4")

# Associativity της L1 Data Cache
l1_dcache_associativities=("4" "8")

# Associativity της L2 Cache
l2_cache_associativities=("8")

# Μεγέθη Cache Line
cache_line_sizes=("64" "128")

# Μέγιστος αριθμός εντολών προς προσομοίωση
max_instructions="100000000"

# Benchmark αρχείο εκτέλεσης
benchmark="spec_cpu2006/458.sjeng/src/specsjeng"
input_file="spec_cpu2006/458.sjeng/data/test.txt"

# Βρόγχοι για όλες τις πιθανές παραμέτρους συνδυαστικά
for l1_icache in "${l1_icache_sizes[@]}"; do
  for l1_dcache in "${l1_dcache_sizes[@]}"; do
    for l2_cache in "${l2_cache_sizes[@]}"; do
      for l1i_assoc in "${l1_icache_associativities[@]}"; do
        for l1d_assoc in "${l1_dcache_associativities[@]}"; do
          for l2_assoc in "${l2_cache_associativities[@]}"; do
            for line_size in "${cache_line_sizes[@]}"; do
              # Ορισμός καταλόγου εξόδου για τα αποτελέσματα
              output_dir="spec_results_s/jeng5/${l1_icache}_${l1_dcache}_${l2_cache}_${l1i_assoc}_${l1d_assoc}_${l2_assoc}_${line_size}"
              mkdir -p "$output_dir"

              # Εκτέλεση του gem5 με τις επιλεγμένες παραμέτρους
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

echo "Η εκτέλεση των προσομοιώσεων ολοκληρώθηκε."
