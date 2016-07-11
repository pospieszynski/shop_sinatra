module Shop
  class FindProductInWarehouseById
    def call(id)
      WAREHOUSE.find do |commodity|
        commodity.product_id == id
      end
    end
  end
end
