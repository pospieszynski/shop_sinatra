module Shop

  class PriceNet

    def call
      puts WAREHOUSE.inspect
      BASKET.reduce(0){ |sum, n| sum += n.quantity * PRODUCTS_CATALOGUE.find{ |product| product.id == n.product_id }.price }.to_f.round(2)
    end
  end
end
