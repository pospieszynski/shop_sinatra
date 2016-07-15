module Shop
  class Product
    attr_reader :id, :name, :price

    @@id = 0

    def initialize(name, price)
      arguments_validation( name, price )
      @id = set_id
      @name = name
      @price = price
    end

    def to_hash
      {name: name, price: price, id: id}
    end

    private
    def set_id
      @@id += 1
    end

    def arguments_validation name, price
      raise ArgumentError if name == nil || price == nil
      raise TypeError unless name.is_a?(String) && price.is_a?(Numeric)
    end
  end
end
