require "rspec"
require "./lib/item"
require "./lib/food_truck"
require "./lib/event"

RSpec.describe Event do
  describe "Iteration 2" do
    before(:each) do
      @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      @food_truck = FoodTruck.new("Rocky Mountain Pies")
      @event = Event.new("South Pearl Street Farmers Market")
    end

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
end
