require "rspec"
require "./lib/item"
require "./lib/food_truck"

RSpec.describe FoodTruck do
  describe "Iteration 1" do
    before(:each) do
      @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      @food_truck = FoodTruck.new("Rocky Mountain Pies")
    end

    it "exists" do
      expect(@food_truck).to be_a(FoodTruck)
    end


  end
end