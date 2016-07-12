module Shop
  class TotalGross
    attr_reader :value
    def initialize price, quantity
      @value = TotalNet.new(price, quantity).value * 1.23
    end

    def value_format
      "%0.2f" % value
    end
  end
end