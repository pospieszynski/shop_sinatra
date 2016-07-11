module Shop
  class CreateWarehouse
    def call(product_id, quantity)
      WAREHOUSE << Commodity.new(product_id, quantity)
    end
  end
end
