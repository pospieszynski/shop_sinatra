require "bundler/setup"
require "sinatra/base"

Dir["./lib/**/*.rb"].each { |file| require file }

module Shop

  PRODUCTS_CATALOGUE = [
      Product.new('Milk', 2),
      Product.new('Bread', 3),
      Product.new('Soap', 4),
      Product.new('Trousers', 20),
      Product.new('Pizza', 6),
  ]

  WAREHOUSE = [
      Commodity.new(1, 2),
      Commodity.new(2, 2),
      Commodity.new(3, 2),
      Commodity.new(4, 2),
      Commodity.new(5, 2),
  ]

  BASKET = []

  USERS = []

  class App < Sinatra::Base
    get "/" do
      erb :root
    end

    get "/products" do
      products = FetchProducts.new.call
      erb :"products/index", locals: {products: products}
    end

    get '/products/:id' do
      commodity = WAREHOUSE.find { |commodity| commodity.product_id == params['id'].to_i }
      product = PRODUCTS_CATALOGUE.find { |product_el| product_el.id == params['id'].to_i }
      erb :"products/show", locals: {commodity: commodity, product: product}
    end

    get '/basket' do
      products = []
      BASKET.each do |commodity|
        product = PRODUCTS_CATALOGUE.find { |product| product.id == commodity.product_id }
        product = product.to_hash
        product.merge!({quantity: commodity.quantity, total_gross: TotalGross.new(product[:price], commodity.quantity).value_format})
        products << product
      end
      gross = PriceGross.new.call
      net = PriceNet.new.call
      erb :"basket/index", locals: {gross: gross, net: net, products: products}
    end

    get '/warehouse' do
      products = []
      WAREHOUSE.each do |commodity|
        product = PRODUCTS_CATALOGUE.find { |product| product.id == commodity.product_id }
        product = product.to_hash
        product.merge!({quantity: commodity.quantity})
        products << product
      end
      catalogue = FetchProducts.new.call
      erb :"warehouse/index", locals: {catalogue: catalogue, products: products}
    end

    post '/warehouse_remove' do
      DeleteCommodityFromWarehouse.new.call(params['product_id'].to_i)
      redirect '/warehouse'
    end

    post '/warehouse' do
      begin
        AddCommodityToWarehouse.new.call(params.fetch('product_id').to_i, params.fetch('quantity').to_i)
        redirect '/warehouse'
      rescue KeyError
        halt 422
      end
    end

    post '/basket' do
      begin
        AddProductToBasket.new.call(params.fetch('product_id').to_i, params.fetch('quantity').to_i)
        redirect '/basket'
      rescue KeyError
        halt 422
      end
    end

    post '/basket_remove' do
      begin
        RemoveProductFromBasket.new.call(params.fetch('product_id').to_i)
        redirect '/basket'
      rescue
        halt 422
      end
    end

    post '/sign_up' do
      session[:user] = AddUser.new(params).call
      redirect '/', locals: {session: session}
    end
  end
end
