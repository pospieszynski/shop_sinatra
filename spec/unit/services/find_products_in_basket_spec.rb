require_relative "../../../sinatra_app"

RSpec.describe Shop::FindProductInBasket do

  subject(:product_fetcher) { Shop::FindProductInBasket.new }

  before do
    Shop::CreateWarehouse.new.call
    Shop::BASKET.clear
  end

  describe "#call" do
    let(:commodity) { Shop::BASKET[0] }

    it "returns all products" do
      Shop::AddProductToBasket.new.call(1, 2)
      expect(product_fetcher.call(1)).to eq(commodity)
    end
  end
end
