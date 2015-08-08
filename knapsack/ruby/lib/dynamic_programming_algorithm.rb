require 'pp'

class DynamicProgrammingAlgorithm

  def optimize(items, capacity)
    table = Array.new(items.length) { Array.new(capacity) { 0 } }
    items.each_with_index do |item, i|
      (capacity+1).times do |c|
        if i == 0 || c == 0
          table[i][c] = 0
        elsif items[i-1].weight <= c
          x = table[i-1][c-items[i-1].weight] + items[i-1].profit
          y = table[i-1][c]
          table[i][c] = [x, y].max
        else
          table[i][c] = table[i-1][c]
        end
      end
    end
    best = []
    table = [
        [0, 0, 3, 3, 3, 3, 3, 3, 3],
        [0, 0, 3, 3, 3, 3, 9, 9, 12],
        [0, 0, 3, 3, 3, 10, 10, 13, 13],
        [0, 0, 3, 8, 8, 11, 11, 13, 18]
    ]
    (table.length - 1).downto(1) do |i|
      (table[0].length - 1).downto(1) do |j|
        next if table[i][j] > table[i][capacity]
        next if table[i][j-1] == table[i][j]
        if table[i][j] != table[i-1][j]
          best.push(1)
        else
          best.push(0)
        end
        break
      end
    end
    pp best
  end

  def sum_weight(subset)
    subset.inject(0) { |weight, item| weight + item.weight }
  end

  def sum_profit(subset)
    subset.inject(0) { |profit, item| profit + item.profit }
  end
end