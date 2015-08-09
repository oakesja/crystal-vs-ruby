require "spec"
require "../src/knapsack_optimizer"

describe "KnapsackOptimizer" do

  describe "#brute_force" do
    it "finds the best objects to pick to optimize your profit using a brute force algorithm" do
          capacity = 165
          weights = [23, 31, 29, 44, 53, 38, 63, 85, 89, 82]
          values = [92, 57, 49, 68, 60, 43, 67, 84, 87, 72]
          solution = [1, 1, 1, 1, 0, 1, 0, 0, 0, 0]
          actual = KnapsackOptimizer.new.brute_force(capacity, weights, values)
          actual.should eq solution
      end
  end
end
