require_relative "../../../lib/services/add_product_to_basket"
require_relative "../../../sinatra_app"

RSpec.describe Shop::AddProductToBasket do
  let(:commodity_to_basket_adder) { Shop::AddProductToBasket.new }

  context "#proper params" do
    before do
      Shop::BASKET.clear
      Shop::CreateWarehouse.new.call
    end

    it "increases quantity no. of product already existing in a basket" do
      commodity_to_basket_adder.call(3, 1)
      expect { commodity_to_basket_adder.call(3, 1) }.to change { Shop::BASKET[0].quantity }.by(1)
    end

    it "adds commodity instance to warehouse array if there is no commodity with a given product id" do
      expect { commodity_to_basket_adder.call(1, 1) }.to change { Shop::BASKET.size }.from(0).to(1)
    end
  end

  context "#wrong params" do
    it "returns nil if there is no such product to be added" do
      expect(commodity_to_basket_adder.call(55, 10)).to be_nil
    end

    it "returns nil if cannot provide commodity of a given quantity" do
      expect(commodity_to_basket_adder.call(1, 100)).to be_nil
    end
  end
end
