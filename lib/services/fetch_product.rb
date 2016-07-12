module Shop
  class FetchProduct
    def call(id)
      PRODUCTS_CATALOGUE.find{ |product| product.id == id }
    end
  end
end
