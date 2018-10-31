require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Josh") }
  let(:pie) { Dessert.new("pie", 50, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(pie.type).to eq('pie')
    end

    it "sets a quantity" do
      expect(pie.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(pie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { pie.quantity("") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) do
      pie.add_ingredient('pickle')
    end
    it "adds an ingredient to the ingredients array" do
      expect(pie.ingredients.length).to eq(1)
    end
  end

  describe "#mix!" do
    before(:each) do
      pie.add_ingredient('pickle')
      pie.add_ingredient('tofu')
      pie.add_ingredient('chicken')
      pie.add_ingredient('vodka')
      pie.mix!
    end
    it "shuffles the ingredient array" do
      expect(pie.ingredients).to_not eq(['pickle', 'tofu', 'chicken','vodka'])
    end
  end

  describe "#eat" do
    before(:each) do
      pie.eat(30)
    end
    it "subtracts an amount from the quantity" do
      expect(pie.quantity).to eq(20)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {pie.eat(70)}.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Josh the Great Baker")
      expect(pie.serve).to eq("Chef Josh the Great Baker has made 50 pies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(pie)
      pie.make_more
    end
  end
end
