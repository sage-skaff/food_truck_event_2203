require "rspec"
require "./lib/item"
require "./lib/food_truck"
require "./lib/event"

RSpec.describe Event do
  before(:each) do
    @event = Event.new("South Pearl Street Farmers Market")
  end

  describe "Initialize" do

    it "exists" do
      expect(@event).to be_a(Event)
    end

    it "has readable attributes" do
      expect(@event.name).to eq("South Pearl Street Farmers Market")
    end

    it "has no food trucks by default" do
      expect(@event.food_trucks).to eq([])
    end
  end

  describe "Iteration 2" do
    before(:each) do
      @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      @food_truck1.stock(@item1, 35)
      @food_truck1.stock(@item2, 7)
      @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      @food_truck2.stock(@item4, 50)
      @food_truck2.stock(@item3, 25)
      @food_truck3 = FoodTruck.new("Palisade Peach Shack")
      @food_truck3.stock(@item1, 65)
    end

    it "can add food trucks" do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
      expect(@event.food_trucks).to eq([@food_truck1, @food_truck2, @food_truck3])
    end

    it "can list food truck names" do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
      expect(@event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end

    it "can list food trucks that sell a given item" do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
      expect(@event.food_trucks_that_sell(@item1)).to eq([@food_truck1, @food_truck3])
      expect(@event.food_trucks_that_sell(@item4)).to eq([@food_truck2])
    end
  end

  describe "Iteration 3" do
    before(:each) do
      @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      @food_truck1.stock(@item1, 35)
      @food_truck1.stock(@item2, 7)
      @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      @food_truck2.stock(@item4, 50)
      @food_truck2.stock(@item3, 25)
      @food_truck3 = FoodTruck.new("Palisade Peach Shack")
      @food_truck3.stock(@item1, 65)
      @food_truck3.stock(@item3, 10)
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
    end

    it "can list items" do
      expect(@event.item_list).to eq([@item1, @item2, @item4, @item3])
    end

    it "can list items sorted by name" do
      expect(@event.sorted_item_list).to eq([@item2, @item4, @item1, @item3])
    end

    it "can list overstocked items" do
      expect(@event.overstocked_items).to eq([@item1])
    end

    it "can find the total quantity of an item" do
      expect(@event.total_quantity(@item1)).to eq(100)
    end

    it "can list total inventory" do
      expect(@event.total_inventory).to eq({
        @item1 => {quantity: 100, food_trucks: [@food_truck1, @food_truck3]},
        @item2 => {quantity: 7,   food_trucks: [@food_truck1]},
        @item4 => {quantity: 50,  food_trucks: [@food_truck2]},
        @item3 => {quantity: 35,  food_trucks: [@food_truck2, @food_truck3]}
        })
    end
  end
end
