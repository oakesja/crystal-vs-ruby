require "benchmark"
require "./src/knapsack_optimizer"

lines = File.read_lines(ARGV.shift)
capacity = lines.shift.to_i
weights = [] of Int32
values = [] of Int32
lines.each do |l|
  match = l =~ /(\d*)\s(\d*)/
  values.push($1.to_i)
  weights.push($2.to_i)
end

time =  Benchmark.realtime do
  KnapsackOptimizer.new.brute_force(capacity, weights, values)
end
puts time
time