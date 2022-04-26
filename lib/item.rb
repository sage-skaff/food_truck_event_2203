class Item
  attr_reader :name, :price

  def initialize(input)
    @name = input[:name]
    @price = input[:price].delete("$").to_f
  end

end
