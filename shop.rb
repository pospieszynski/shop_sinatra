Dir["./lib/**/*.rb"].each { |file| require file }

module Shop
  PRODUCTS_CATALOGUE = [
    Product.new('Milk', 2),
    Product.new('Bread', 3),
    Product.new('Soap', 4),
    Product.new('Trousers', 20),
    Product.new('Pizza', 6),
  ]

  WAREHOUSE = [
    Commodity.new(1, 2),
    Commodity.new(2, 2),
    Commodity.new(3, 2),
    Commodity.new(4, 2),
    Commodity.new(5, 2),
  ]

  BASKET = []

  class Main
    def self.run
      PRODUCTS_CATALOGUE.each do |product|
        CreateWarehouse.new.call(product.id, rand(1..10))
      end
    end
  end
end

Shop::Main.run
puts Shop::PRODUCTS_CATALOGUE.inspect
puts ""
puts Shop::WAREHOUSE.inspect
Shop::DeleteCommodityFromWarehouse.new.call(1, 1)
puts "\nDeleted from warehouse product of id == 1 of quantity 1"
puts Shop::WAREHOUSE.inspect
Shop::AddCommodityToWarehouse.new.call(1, 2)
puts "\nAdded product to warehouse of id ==1 of quantitty 2"
puts "\nWAREHOUSE" + Shop::WAREHOUSE.inspect
puts ""
puts "\nEMPTY BASKET: " + Shop::BASKET.inspect
Shop::AddProductToBasket.new.call(1, 2)
puts "\nAdded 2 products of id == 1 to the basket"
puts "Total brutto = " + Shop::PriceGross.new.call.to_s
puts ""
puts ""
puts "\nBASKET: " + Shop::BASKET.inspect
puts ""
puts ""
puts Shop::Receipt.new.call()
puts ""
puts ""
puts "\nWAREHOUSE" + Shop::WAREHOUSE.inspect
Shop::RemoveProductFromBasket.new.call(1, 2)
puts "\nRemoved 2 products of id == 1 from the basket"
puts "\nBASKET: " + Shop::BASKET.inspect
puts "\nWAREHOUSE" + Shop::WAREHOUSE.inspect
