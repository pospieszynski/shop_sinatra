require_relative './fetch_commodity'

module Shop
  class DeleteCommodityFromWarehouse
    def call(id, quantity = 1)
      commodity = FetchCommodity.new().call(id)

      return unless commodity

      reduce_commodity_quantity(commodity, quantity)
    end

    private
    def reduce_commodity_quantity(commodity, quantity)
      if commodity.quantity > quantity
        commodity.quantity -= quantity
      else
        WAREHOUSE.delete(commodity)
      end
    end
  end
end
