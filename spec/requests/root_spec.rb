require "web_helper"

RSpec.describe "GET /", type: :request do

  before do
    do_request
  end

  it "returns 200 HTTP code" do
    expect(last_response.status).to eql(200)
  end

  it "returns valid html Content-Type" do
    expect(last_response.headers["Content-Type"]).to include("text/html")
  end

  it "returns h1 element with 'Biedronka' value" do
    expect(last_response.body).to include("<h1>Biedronka</h1>")
  end

  it "returns h4 element with 'Low prices everyday!' value" do
    expect(last_response.body).to include("<h4><i>Low prices everyday!</i></h4>")
  end

  it "returns link to home" do
    expect(last_response.body).to include("<a href=\"/\">HOME</a>")
  end

  it "returns link to basket" do
    expect(last_response.body).to include("<a href=\"/basket\">BASKET</a>")
  end

  it "returns link to products" do
    expect(last_response.body).to include("<a href=\"/products\">PRODUCTS</a>")
  end

  it "returns link to warehouse" do
    expect(last_response.body).to include("<a href=\"/warehouse\">WAREHOUSE</a>")
  end

  private
  def do_request
    get "/"
  end
end