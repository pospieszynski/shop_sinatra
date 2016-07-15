require "web_helper"

RSpec.describe "POST /basket_remove", type: :request do
  context "invalid params" do
    let(:invalid_params) { { foo: 'bar' } }

    before do
      do_request(invalid_params)
    end

    it "returns 422 HTTP status code" do
      expect(last_response.status).to eql(422)
    end
  end

  context "valid params" do
    let(:params) { { "product_id" => 1, "quantity" => 1 } }
    let(:domain) { "http://example.org" }

    before do
      Shop::AddProductToBasket.new.call(1, 2)
      do_request(params)
    end

    it "returns 200 HTTP status code" do
      follow_redirect!
      expect(last_response.status).to eql(200)
    end

    it "redirects to BASKET" do
      follow_redirect!
      expect(last_request.url).to eql(domain + "/basket")
    end

    it "calls Remove Product From Basket with proper params" do
      Shop::AddProductToBasket.new.call(1, 2)
      remover = Shop::RemoveProductFromBasket.new
      expect(Shop::RemoveProductFromBasket).to receive(:new).and_return remover
      expect(remover).to receive(:call).with(1).and_call_original
      do_request(params)
    end
  end

  private
  def do_request(params={})
    post '/basket_remove', params
  end
end
