require "web_helper"

RSpec.describe "GET /warehouse", type: :request do
  before do
    do_request
  end

  it "returns 200 HTTP code" do
    expect(last_response.status).to eql(200)
  end

  it "returns valid html Content-Type" do
    expect(last_response.headers["Content-Type"]).to include("text/html")
  end

  it "Displays table of products" do
    expect(last_response.body).to include() #todo
  end

  private
  def do_request
    get "/warehouse"
  end
end
