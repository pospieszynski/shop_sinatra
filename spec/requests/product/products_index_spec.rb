require "web_helper"

RSpec.describe "GET /products", type: :request do
  context "proper view" do
    let(:products) { Shop::FetchProducts.new.call }

    before do
      do_request
    end

    it "returns 200 HTTP code" do
      expect(last_response.status).to eql(200)
    end

    it "displays all products" do
      products.each do |product|
        expect(last_response.body).to include("<a href=\"/products/#{product.id }\"> #{product.name }</a>")
      end
    end

    private
    def do_request
      get "/products"
    end
  end
end
