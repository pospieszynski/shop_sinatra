require_relative '../../../lib/models/product'

RSpec.describe Shop::Commodity do

  context "#initialize" do

    it "raises an ArgumentError when two arguments are not provided" do
      expect {
        Shop::Commodity.new(nil, nil)
      }.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError when quantity is not provided" do
      expect {
        Shop::Commodity.new(1, nil)
      }.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError when product_id is not provided" do
      expect {
        Shop::Commodity.new(nil, 12)
      }.to raise_error(ArgumentError)
    end

    it "raises a TypeError when quantity is not of numeric type" do
      expect {
        Shop::Commodity.new(1, "12.5")
      }.to raise_error(TypeError)
    end

    it "raises a TypeError when id is not a number" do
      expect {
        Shop::Commodity.new("12", 12)
      }.to raise_error(TypeError)
    end

    it "raises a TypeError when both arguments are of improper type" do
      expect {
        Shop::Commodity.new("12", "milk")
      }.to raise_error(TypeError)
    end

    it "it throws a NoMethodError when trying to access class attribute" do
      expect {
        Shop::Commodity.id_max
      }.to raise_error(NoMethodError)
    end
  end
end
