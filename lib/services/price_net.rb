module Shop
  class PriceNet
    def call
      price = BASKET.reduce(0){ |sum, n| sum += n.quantity * FetchProduct.new.call(n.product_id).price }
      price = convert_to_fload_and_round price
    end

    private
    def convert_to_fload_and_round price
      price.to_f.round(2)
    end
  end
end
