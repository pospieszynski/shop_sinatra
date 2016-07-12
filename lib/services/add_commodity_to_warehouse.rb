require_relative './fetch_product'
require_relative './find_product_in_warehouse_by_id'

module Shop
  class AddCommodityToWarehouse
    def call(id, quantity = 1)
      product = FetchProduct.new().call(id)
      return unless product
      commodity = FindProductInWarehouseById.new().call(id)

      if commodity
        commodity.quantity += quantity
      else
        WAREHOUSE << Shop::Commodity.new(id, quantity)
      end
    end
  end
end
