require_relative "../../../sinatra_app"

RSpec.describe Shop::FetchProducts do

  subject(:products_fetcher) { Shop::FetchProducts.new }

  describe "#call" do
    let(:all_products) { Shop::PRODUCTS_CATALOGUE }

    it "returns all products" do
      expect(products_fetcher.call).to eq(all_products)
    end
  end
end
