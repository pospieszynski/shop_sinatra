require_relative "../../../sinatra_app"

RSpec.describe Shop::FindProductInWarehouseById do

  subject(:commodity_fetcher) { Shop::FindProductInWarehouseById.new }

  before do
    Shop::CreateWarehouse.new.call
  end

  describe "#call" do
    let(:commodity) { Shop::WAREHOUSE[0] }

    it "returns all products" do
      expect(commodity_fetcher.call(1)).to eq(commodity)
    end
  end
end
