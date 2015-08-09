require 'knapsack_optimizer'

describe KnapsackOptimizer do
  subject { KnapsackOptimizer.new }

  describe '#brute_force' do
    it 'finds the best objects to pick to optimize your profit using a brute force algorithm' do
      test_cases.each do |capacity, weights, values, expected|
        actual = subject.brute_force(capacity: capacity, weights: weights, values: values)
        expect(actual).to eql expected
      end
    end
  end

  def test_cases
    [
        [
            165,
            [23, 31, 29, 44, 53, 38, 63, 85, 89, 82],
            [92, 57, 49, 68, 60, 43, 67, 84, 87, 72],
            [1, 1, 1, 1, 0, 1, 0, 0, 0, 0]
        ],
        [
            750,
            [70, 73, 77, 80, 82, 87, 90, 94, 98, 106, 110, 113, 115, 118, 120],
            [135, 139, 149, 150, 156, 163, 173, 184, 192, 201, 210, 214, 221, 229, 240],
            [1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 1]
        ]
    ]
  end
end