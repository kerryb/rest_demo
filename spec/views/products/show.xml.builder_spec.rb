require 'spec_helper'

describe "products/show.xml.builder" do
  before do
    @product = Factory(:product, :code => "A", :description => "Foo", :price => "1.99")
    assigns[:product] = @product
    render "/products/show.xml.builder"
    @doc = Nokogiri::XML(response.body)
  end

  it "renders a product element with a URI" do
    @doc.xpath("/product/@self").text.should == product_url(@product)
  end

  it "renders a code" do
    @doc.xpath("/product/code").map(&:text).should =~ [@product.code]
  end

  it "renders a description" do
    @doc.xpath("/product/description").map(&:text).should =~ [@product.description]
  end

  it "renders a price" do
    @doc.xpath("/product/price").map(&:text).should =~ [number_to_currency(@product.price, :unit => "£")]
  end
end
