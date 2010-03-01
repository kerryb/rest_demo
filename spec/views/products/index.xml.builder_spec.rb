require 'spec_helper'

describe "products/index.xml.builder" do
  before do
    @products = [
      Factory(:product, :code => "A", :description => "Foo", :price => "1.99"),
      Factory(:product, :code => "B", :description => "Bar", :price => "3.99")
    ]
    assigns[:products] = @products
    render "/products/index.xml.builder"
    @doc = Nokogiri::XML(response.body)
  end

  it "renders a products element with a URI" do
    @doc.xpath("/products/@self").text.should == products_url
  end

  it "renders a list of products" do
    @doc.xpath("/products/product").length.should == 2
  end

  describe "renders each product" do
    it "with a view link" do
      @doc.xpath("/products/product/link[@rel='view'][@method='get']/@href").map(&:text).should =~
        @products.map {|p| product_url p}
    end

    it "with a code" do
      @doc.xpath("/products/product/code").map(&:text).should =~
        @products.map(&:code)
    end

    it "with a description" do
      @doc.xpath("/products/product/description").map(&:text).should =~
        @products.map(&:description)
    end

    it "with a price" do
      @doc.xpath("/products/product/price").map(&:text).should =~
        @products.map {|p| number_to_currency(p.price, :unit => "£")}
    end
  end
end
