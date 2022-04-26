class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    inventory[item] = 0 if inventory[item].nil?
    inventory[item]
  end

  def stock(item, amount)
    if inventory[item].nil?
      inventory[item] = amount
    else
      inventory[item] += amount
    end
  end

  def potential_revenue
    inventory.sum { |item, stock| item.price * stock }
  end
end
