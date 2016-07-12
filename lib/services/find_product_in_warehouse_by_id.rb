module Shop
  class FindProductInWarehouseById
    def call(id)
      WAREHOUSE.find{ |commodity| commodity.product_id == id }
    end
  end
end
