require_relative "../../../sinatra_app"

RSpec.describe Shop::PriceGross do
  let(:price_gross) { Shop::PriceGross.new }

  before do
    Shop::BASKET.clear
    Shop::CreateWarehouse.new.call
  end

  it "returns proper price gross" do
    Shop::AddProductToBasket.new.call(3, 2)
    expect(price_gross.call).to eql(9.84)
  end
end
