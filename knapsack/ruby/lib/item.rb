class Item
  attr_reader :weight, :value, :id

  def initialize(id, weight, value)
    @id = id
    @weight = weight
    @value = value
  end
end