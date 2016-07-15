require_relative "../../../sinatra_app"

RSpec.describe Shop::RemoveProductFromBasket do

  let(:commodity_from_basket_remover) { Shop::RemoveProductFromBasket.new }

  context "#proper params" do

    before do
      Shop::BASKET.clear
      Shop::CreateWarehouse.new.call
    end

    it "descreases quantity no. of product already existing in a warehouse" do
      Shop::AddProductToBasket.new.call(1, 2)
      expect{ commodity_from_basket_remover.call(1, 1) }.to change { Shop::BASKET[0].quantity }.by(-1)
    end

    it "removes entirely commodity instance from warehouse array if requested quantity >= real quantity " do
      Shop::AddProductToBasket.new.call(4, 2)
      expect{ commodity_from_basket_remover.call(4, 2) }.to change { Shop::BASKET.size}.from(1).to(0)
    end
  end

  context "#wrong params" do
    it "returns nil if there is no such product to be removed" do
      expect(commodity_from_basket_remover.call(55, 10)).to be_nil
    end
  end
end
