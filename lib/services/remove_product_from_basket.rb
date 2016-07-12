require_relative './fetch_commodity'
require_relative './add_commodity_to_warehouse'

module Shop
  class RemoveProductFromBasket
    def call(id, quantity = 1)
      commodity = FindProductInBasket.new().call(id)
      return unless commodity || commodity.quantity < quantity

      reduce_commodity_quantity(commodity, quantity)
      AddCommodityToWarehouse.new().call(id, quantity)
    end

    private
    def reduce_commodity_quantity(commodity, quantity)
      if commodity.quantity > quantity
        commodity.quantity -= quantity
      else
        BASKET.delete(commodity)
      end
    end
  end
end
