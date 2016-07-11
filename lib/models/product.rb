module Shop
  class Product
    attr_reader :id, :name, :price

    @@id = 0

    def initialize(name, price)
      @id = set_id
      @name = name
      @price = price
    end

    private
    def set_id
      @@id += 1
    end
  end
end
