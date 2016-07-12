module Shop
  class TotalNet
    attr_reader :value
    def initialize price, quantity
      @value = price * quantity
    end
  end
end