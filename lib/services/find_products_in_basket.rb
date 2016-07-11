module Shop
  class FindProductInBasket
    def call(id)
      BASKET.find do |commodity|
        commodity.product_id == id
      end
    end
  end
end
