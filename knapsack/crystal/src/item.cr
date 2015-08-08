class Item
  getter(:weight, :value, :id)

  def initialize(id, weight, value)
    @id = id
    @weight = weight
    @value = value
  end
end