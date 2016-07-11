require_relative './find_product_in_warehouse_by_id'
require_relative './delete_commodity_from_warehouse'
require_relative './find_products_in_basket'


module Shop

  class AddProductToBasket

    def call(id, quantity)

      return unless commodity = FindProductInWarehouseById.new().call(id) || commodity.quantity < quantity
      Shop::DeleteCommodityFromWarehouse.new().call(id, quantity)
      if commodity = Shop::FindProductInBasket.new().call(id)
        commodity.quantity+=quantity
      else
        BASKET << Commodity.new(id, quantity)
      end
    end
  end
end
