class Item
  attr_reader :weight, :profit, :id

  def initialize(id, weight, profit)
    @id = id
    @weight = weight
    @profit = profit
  end
end