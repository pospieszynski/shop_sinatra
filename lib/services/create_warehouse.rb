require_relative "../models/commodity"

module Shop
  class CreateWarehouse
    def call
      WAREHOUSE.clear
      5.times { |i| WAREHOUSE << Commodity.new(i+1, 2) }
    end
  end
end
