require "rspec"
require "./lib/item"

RSpec.describe Item do
  describe "Iteration 1" do
    before(:each) do
      @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    end

    it "exists" do
      expect(@item1).to be_a(Item)
    end

    it "has readable attributes" do
      expect(@item2.name).to eq('Apple Pie (Slice)')
      expect(@item2.price).to eq(2.50)
    end
  end
end
