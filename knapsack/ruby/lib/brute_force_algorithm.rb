class BruteForceAlgorithm

  def optimize(items, capacity)
    best_profit = 0
    best_set = []
    items.each_index  do |i|
      subsets = items.combination(i).to_a
      subsets.each do |subset|
        weight = sum_weight(subset)
        next if weight > capacity
        profit = sum_profit(subset)
        if profit > best_profit
          best_profit = profit
          best_set = subset
        end
      end
    end
    best_set
  end

  def sum_weight(subset)
    subset.inject(0) { |weight, item| weight + item.weight }
  end

  def sum_profit(subset)
    subset.inject(0) { |profit, item| profit + item.profit }
  end
end