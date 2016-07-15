require_relative "../../../sinatra_app"

RSpec.describe Shop::DeleteCommodityFromWarehouse do

  let(:commodity_from_warehouse_remover) { Shop::DeleteCommodityFromWarehouse.new }

  before do
    Shop::CreateWarehouse.new.call
  end

  context "#proper params" do
    it "descreases quantity no. of product already existing in a warehouse" do
      expect{ commodity_from_warehouse_remover.call(1, 1) }.to change { Shop::WAREHOUSE[0].quantity }.by(-1)
    end

    it "removes entirely commodity instance from warehouse array if requested quantity <= real quantity " do
      expect{ commodity_from_warehouse_remover.call(3, 2) }.to change { Shop::WAREHOUSE.size}.from(5).to(4)
    end
  end

  context "#wrong params" do
    it "returns nil if there is no such product to be added" do
      expect(commodity_from_warehouse_remover.call(55, 10)).to be_nil
    end
  end
end
