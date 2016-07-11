module Shop
  class FetchCommodity
    def call(id)
      WAREHOUSE.find do |commodity|
        commodity.id == id
      end
    end
  end
end
