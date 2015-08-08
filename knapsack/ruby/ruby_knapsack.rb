# require 'benchmark'
# require_relative 'lib/knapsack_optimizer'
#
# capacity = 6404180
# weights = [382745, 799601, 909247, 729069, 467902, 44328, 34610, 698150, 823460, 903959, 853665, 551830, 610856, 670702, 488960, 951111, 323046, 446298, 931161, 31385, 496951, 264724, 224916, 169684]
# profits = [825594, 1677009, 1676628, 1523970, 943972, 97426, 69666, 1296457, 1679693, 1902996, 1844992, 1049289, 1252836, 1319836, 953277, 2067538, 675367, 853655, 1826027, 65731, 901489, 577243, 466257, 369261]
# expected = [1, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1]
#
# # capacity = 750
# # weights = [70, 73, 77, 80, 82, 87, 90, 94, 98, 106, 110, 113, 115, 118, 120]
# # profits = [135, 139, 149, 150, 156, 163, 173, 184, 192, 201, 210, 214, 221, 229, 240]
# # expected = [1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1]
#
# time =  Benchmark.measure do
#   actual = KnapsackOptimizer.new.brute_force(capacity: capacity, weights: weights, profits: profits)
#   expected == actual or raise 'Expected output does not match actual'
# end
#
# puts time
require 'pp'

def subsets(array, size)
  used = Array.new(array.length) { |i| -1 }
  subset_helper(array, used, 0, 0, size, [])
end

def subset_helper(array, used, current, current_size, size, accl)
  if size == current_size
    accl << used.reject! { |x| x == -1 }
  elsif current < array.length
    x = used.dup
    x[current] = array[current]
    subset_helper(array, x, current + 1, current_size + 1, size, accl)
    y = used.dup
    y[current] = -1
    subset_helper(array, used, current + 1, current_size, size, accl)
  end
  accl
end

array = [1, 2, 3, 4]
pp subsets(array, 2)