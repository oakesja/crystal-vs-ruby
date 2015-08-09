require "./item"

class BruteForceAlgorithm

  def optimize(items, capacity)
    best_profit = 0
    best_set = [] of Item
    items.each_index  do |i|
      subsets = subsets_of_size(items, i)
      subsets.each do |subset|
        weight = sum_weight(subset)
        next if weight > capacity
        value = sum_profit(subset)
        if value > best_profit
          best_profit = value
          best_set = subset
        end
      end
    end
    best_set
  end

  def subsets_of_size(array, size)
    subset_helper(array, size, 0, [] of Item, [] of Array(Item))
  end

  def subset_helper(array, size, current_index, subset, accl)
    if size == subset.length
      accl << subset
    elsif current_index < array.length
      subset_with_current = subset.dup
      subset_with_current << array[current_index]
      subset_helper(array, size, current_index + 1, subset_with_current, accl)
      subset_helper(array, size, current_index + 1, subset, accl)
    end
    accl
  end 

  def sum_weight(subset)
    subset.sum(&.weight)
  end

  def sum_profit(subset)
    subset.sum(&.value)
  end
end