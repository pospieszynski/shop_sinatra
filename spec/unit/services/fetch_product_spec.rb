require_relative "../../../sinatra_app"

RSpec.describe Shop::FetchProduct do

  subject(:product_fetcher) { Shop::FetchProduct.new }

  describe "#call" do
    let(:product) { Shop::PRODUCTS_CATALOGUE[0] }

    it "returns requested product" do
      expect(product_fetcher.call(1)).to eq(product)
    end
  end
end
