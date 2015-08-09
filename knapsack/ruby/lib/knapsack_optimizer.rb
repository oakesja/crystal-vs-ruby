require_relative 'item'
require_relative 'brute_force_algorithm'

class KnapsackOptimizer

  def brute_force(capacity: 0, weights: [], values: [])
    items = create_items(values, weights)
    best_items = BruteForceAlgorithm.new.optimize(items, capacity)
    items_to_take_mask(best_items, items)
  end

  def create_items(values, weights)
    weights.each_index.collect do |i|
      Item.new(i, weights[i], values[i])
    end
  end

  def items_to_take_mask(best_items, items)
    items.collect do |item|
      best_items.include?(item) ? 1 : 0
    end
  end
end