require_relative "../../../sinatra_app"

RSpec.describe Shop::AddCommodityToWarehouse do

  let(:commodity_to_warehouse_adder) { Shop::AddCommodityToWarehouse.new }

  context "#proper params" do
    before do
      Shop::CreateWarehouse.new.call
    end
    it "increases quantity no. of product already existing in a warehouse" do
      expect{ commodity_to_warehouse_adder.call(1, 10) }.to change { Shop::WAREHOUSE[0].quantity }.by(10)
    end

    it "adds commodity instance to warehouse array if there is no commodity with a given product id" do
      Shop::WAREHOUSE.clear
      expect{ commodity_to_warehouse_adder.call(1, 10) }.to change { Shop::WAREHOUSE.size}.from(0).to(1)
    end
  end

  context "#wrong params" do
    it "returns nil if there is no such product to be added" do
      expect(commodity_to_warehouse_adder.call(55, 10)).to be_nil
    end
  end
end
