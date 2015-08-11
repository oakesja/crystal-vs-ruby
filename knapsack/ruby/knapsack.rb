require_relative 'lib/knapsack_optimizer'

lines = File.readlines(ARGV.shift)
capacity = lines.shift.to_i
weights = []
values = []
lines.each do |l|
  match = /(\d*)\s(\d*)/.match(l)
  values.push(match[1].to_i)
  weights.push(match[2].to_i)
end

KnapsackOptimizer.new.brute_force(capacity: capacity, weights: weights, values: values)