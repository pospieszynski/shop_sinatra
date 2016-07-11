require 'sinatra'
require_relative './lib/services/add_product_to_basket'
require_relative './shop'

#Shop::Main.run()

get "/" do
 erb :root
end

get "/products" do
  @products = []
  Shop::PRODUCTS_CATALOGUE.each do |product|
      # product = Shop::PRODUCTS_CATALOGUE.find{ |product| product.id == commodity.product_id }
      @products << product
  end
    erb :products_index
end

get '/products/:id' do
  @commodity = Shop::WAREHOUSE.find{ |commodity| commodity.product_id == params['id'].to_i }
  @product = Shop::PRODUCTS_CATALOGUE.find{ |product_el| product_el.id == params['id'].to_i }
  erb :show
end

get '/basket' do
  @products = []
  Shop::BASKET.each do |commodity|
    @products << Shop::PRODUCTS_CATALOGUE.find{ |product| product.id == commodity.product_id }.to_hash.merge!( { quantity: commodity.quantity } )
  end
  @gross = Shop::PriceGross.new().call
  @net = Shop::PriceNet.new().call
  erb :basket
end

post '/basket/add' do
  Shop::AddProductToBasket.new().call( params['product_id'].to_i, params['quantity'].to_i  )
  redirect '/basket'
end

delete '/basket' do
  puts params['product_id'].to_i
  Shop::RemoveProductFromBasket.new().call( params['product_id'].to_i )
  redirect '/basket'
end

