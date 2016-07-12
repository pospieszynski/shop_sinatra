module Shop
  class FetchCommodity
    def call(id)
      WAREHOUSE.find{ |commodity| commodity.product_id == id }
    end
  end
end
