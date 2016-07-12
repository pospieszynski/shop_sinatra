module Shop
  class FetchProduct
    def call(product_id)
      PRODUCTS_CATALOGUE.find{ |product| product.id == product_id }
    end
  end
end
