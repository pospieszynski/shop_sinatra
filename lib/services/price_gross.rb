require_relative './price_net'


module Shop

  class PriceGross

    def call
      PriceNet.new().call() * 1.23
    end
  end
end
