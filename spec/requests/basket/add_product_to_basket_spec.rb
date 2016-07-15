require "web_helper"

RSpec.describe "POST /basket", type: :request do

  context "invalid params" do
    let(:invalid_params) { {foo: 'bar'} }

    before do
      do_request(invalid_params)
    end

    it "returns 422 HTTP status code" do
      expect(last_response.status).to eql(422)
    end
  end

  context "valid params" do
    let(:params) { {product_id: 1, quantity: 10} }
    let(:domain) { "http://example.org" }

    before do
      do_request(params)
    end

    it "returns 200 HTTP status code" do
      follow_redirect!
      expect(last_response.status).to eql(200)
    end

    it "redirect to BASKET" do
      follow_redirect!
      expect(last_request.url).to eql(domain + "/basket")
    end
  end

  it "calls AddToBasket with proper params" do
    params = { "product_id" => "1", "quantity" => "10" }
    add_prod_to_basket = Shop::AddProductToBasket.new
    expect(Shop::AddProductToBasket).to receive(:new).and_return add_prod_to_basket
    expect(add_prod_to_basket).to receive(:call).with(1, 10).and_call_original
    do_request(params)
  end

  private
  def do_request(params={})
    post "/basket", params
  end
end
