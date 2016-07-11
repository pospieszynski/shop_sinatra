module Shop
  class FetchProduct
    def call(id)
      PRODUCTS_CATALOGUE.find do |product|
        product.id == id
      end
    end
  end
end
