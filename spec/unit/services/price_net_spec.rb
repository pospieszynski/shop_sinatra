require_relative "../../../sinatra_app"

RSpec.describe Shop::PriceNet do
  let(:price_net) { Shop::PriceNet.new }

  before do
    Shop::BASKET.clear
    Shop::CreateWarehouse.new.call
  end

  it "returns proper price net" do
    Shop::AddProductToBasket.new.call(4, 1)
    expect(price_net.call).to eql(20.0)
  end
end
