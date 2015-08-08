require "./item"

class BruteForceAlgorithm

  def optimize(items, capacity)
    best_profit = 0
    best_set = [] of Int32
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
    empty = [] of (Array(Item))
    return empty if size == 0
    return array.map { |item| [item] } if size == 1
    return [array] if array.length == size
    temp = empty
    subsets_of_size(array, size + 1).each do |set|
      set.each do |item|
        t = set.dup
        t.delete(item)
        temp.push(t) unless temp.includes?(t)
      end
    end
    temp
end   

  def sum_weight(subset)
    subset.inject(0) { |weight, item| weight + item.weight }
  end

  def sum_profit(subset)
    subset.inject(0) { |value, item| value + item.value }
  end
end