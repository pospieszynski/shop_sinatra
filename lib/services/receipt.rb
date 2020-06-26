require_relative './fetch_product'
require_relative './price_gross'
require_relative './price_net'

module Shop
  class Receipt
    def call
      receipt = "\n*******************"
      receipt += "\n*BIEDRONKA*"
      receipt += "\n*******************"

      BASKET.each do |commodity|
        product = FetchProduct.new.call(commodity.product_id)
        receipt += "\n #{product.name} -- #{commodity.quantity} szt.---  #{product.price * commodity.quantity} PLN\n"
      end
      receipt += "\n*******************"
      receipt += "\nTotal gross --> #{Shop::PriceGross.new.call.to_s} PLN \n"
      receipt += "\nTotal net --> #{Shop::PriceNet.new.call.to_s } PLN\n"
      receipt += "\n===================\n\n"
      receipt += "\nThank you for shopping, see you soon!"
      receipt
    end
  end
end
