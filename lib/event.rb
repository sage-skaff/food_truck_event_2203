require "./lib/food_truck"

class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    food_trucks << food_truck
  end

  def food_truck_names
    food_trucks.map { |food_truck| food_truck.name }
  end

  def food_trucks_that_sell(item)
    food_trucks.map do |food_truck|
       food_truck if food_truck.check_stock(item) > 0
     end.compact
  end

  def sorted_item_list
    item_list.sort_by { |item| item.name }
  end

  def item_list
    items = []
    food_trucks.each do |food_truck|
      food_truck.inventory.keys.each do |item|
        items << item
      end
    end
    items.uniq
  end
end
