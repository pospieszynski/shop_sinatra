require_relative "../../../sinatra_app"

RSpec.describe Shop::FetchCommodity do

  context "proper params" do

  let(:commodity_fetcher) { Shop::FetchCommodity.new }
  let(:commodity) { Shop::WAREHOUSE[0]  }

  before do
    Shop::CreateWarehouse.new.call
  end

    it "returns commodity of a given product id" do
      expect(commodity_fetcher.call(1)).to eq(commodity)
    end
  end
end
