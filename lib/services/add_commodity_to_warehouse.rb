require_relative './fetch_product'
require_relative './find_product_in_warehouse_by_id'

module Shop
  class AddCommodityToWarehouse
    def call(product_id, quantity = 1)
      product = FetchProduct.new.call(product_id)
      return unless product
      commodity = FindProductInWarehouseById.new.call(product_id)

      if commodity
        commodity.quantity += quantity
      else
        WAREHOUSE << Shop::Commodity.new(product_id, quantity)
      end
    end
  end
end
