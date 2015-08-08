require_relative 'item'
require_relative 'brute_force_algorithm'

class KnapsackOptimizer

  def brute_force(capacity: 0, weights: [], profits: [])
    items = create_items(profits, weights)
    best = BruteForceAlgorithm.new.optimize(items, capacity)
    item_include_mask(best, items)
  end

  def create_items(profits, weights)
    weights.each_index.collect do |i|
      Item.new(i, weights[i], profits[i])
    end
  end

  def item_include_mask(best_set, items)
    items.collect do |item|
      best_set.include?(item) ? 1 : 0
    end
  end
end