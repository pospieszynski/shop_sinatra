require "web_helper"

RSpec.describe "GET /products", type: :request do

  before do
    do_request
  end

  table = "
      <tr>
        <td><a href=\"/products/1\"> Milk</a></td>
        <td>2 PLN</td>
      </tr>

      <tr>
        <td><a href=\"/products/2\"> Bread</a></td>
        <td>3 PLN</td>
      </tr>

      <tr>
        <td><a href=\"/products/3\"> Soap</a></td>
        <td>4 PLN</td>
      </tr>

      <tr>
        <td><a href=\"/products/4\"> Trousers</a></td>
        <td>20 PLN</td>
      </tr>

      <tr>
        <td><a href=\"/products/5\"> Pizza</a></td>
        <td>6 PLN</td>
      </tr>
  "

  it "returns 200 HTTP code" do
    expect(last_response.status).to eql(200)
  end

  it "returns valid html Content-Type" do
    expect(last_response.headers["Content-Type"]).to include("text/html")
  end

  it "Displays table of products" do
    expect(last_response.body).to include(table)
  end


  private
  def do_request
    get "/products"
  end
end