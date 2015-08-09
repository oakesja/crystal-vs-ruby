require "./item"
require "./brute_force_alogrithm"

class KnapsackOptimizer

  def brute_force(capacity, weights, values)
    items = create_items(values, weights)
    best_items = BruteForceAlgorithm.new.optimize(items, capacity)
    items_to_take_mask(best_items, items)
  end

  def create_items(values, weights)
    weights.map_with_index do |weight, i|
      Item.new(i, weight, values[i])
    end
  end

  def items_to_take_mask(best_items, items)
    items.map do |item|
      best_items.includes?(item) ? 1 : 0
    end
  end
end