module Shop
  class Commodity
    attr_reader :id, :product_id
    attr_accessor :quantity

    @@current_id = 0

    def initialize(product_id, quantity)
      arguments_validation(product_id, quantity)
      @id = set_id
      @product_id = product_id
      @quantity = quantity
    end

    private
    def set_id
      @@current_id += 1
    end

    def arguments_validation product_id, quantity
      raise ArgumentError if product_id == nil || quantity == nil
      raise TypeError unless product_id.is_a?(Fixnum) && quantity.is_a?(Fixnum)
      raise ArgumentError if quantity < 0
    end
  end
end
