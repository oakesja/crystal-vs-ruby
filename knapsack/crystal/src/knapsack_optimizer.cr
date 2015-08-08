require "./item"
require "./brute_force_alogrithm"

class KnapsackOptimizer

  def brute_force(capacity, weights, values)
    items = create_items(values, weights)
    best = BruteForceAlgorithm.new.optimize(items, capacity)
    item_include_mask(best, items)
  end

  def create_items(values, weights)
    weights.map_with_index do |weight, i|
      Item.new(i, weight, values[i])
    end
  end

  def item_include_mask(best_set, items)
    items.map do |item|
      best_set.includes?(item) ? 1 : 0
    end
  end
end