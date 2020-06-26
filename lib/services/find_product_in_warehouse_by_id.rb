module Shop
  class FindProductInWarehouseById
    def call(product_id)
      WAREHOUSE.find { |commodity| commodity.product_id == product_id }
    end
  end
end
