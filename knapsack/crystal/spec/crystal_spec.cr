require "spec"
require "../src/knapsack_optimizer"

def test_cases
    [
        {
            capacity: 165,
            weights: [23, 31, 29, 44, 53, 38, 63, 85, 89, 82],
            values: [92, 57, 49, 68, 60, 43, 67, 84, 87, 72],
            solution: [1, 1, 1, 1, 0, 1, 0, 0, 0, 0]
        },
        {
            capacity: 750,
            weights: [70, 73, 77, 80, 82, 87, 90, 94, 98, 106, 110, 113, 115, 118, 120],
            values: [135, 139, 149, 150, 156, 163, 173, 184, 192, 201, 210, 214, 221, 229, 240],
            solution: [1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1]
        }
    ]
end

def subsets(array, size)
  used = Array.new(array.length) { |i| -1 }
  subset_helper(array, used, 0, 0, size, [] of Array(Int32))
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

describe "KnapsackOptimizer" do

  describe "#brute_force" do
    it "finds the best objects to pick to optimize your profit using a brute force algorithm" do
      # test_cases.each do |test_case|
          capacity = 165
          weights = [23, 31, 29, 44, 53, 38, 63, 85, 89, 82]
          values = [92, 57, 49, 68, 60, 43, 67, 84, 87, 72]
          solution = [1, 1, 1, 1, 0, 1, 0, 0, 0, 0]
          actual = KnapsackOptimizer.new.brute_force(capacity, weights, values)
          actual.should eq solution
      end
    # end
  end

  # describe "subsets" do 
  #   it "" do 
  #     array = [1, 2, 3, 4]
  #     # subsets(array, 0).should eq Array(Int32).new
  #     subsets(array, 1).should eq [[1], [2], [3], [4]]
  #     subsets(array, 2).should eq [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]
  #     subsets(array, 3).should eq [[1, 2, 3], [1, 3, 4], [2, 3, 4], [1, 2, 4]]
  #     subsets(array, 4).should eq [[1, 2, 3, 4]]
  #   end
  # end  
end
