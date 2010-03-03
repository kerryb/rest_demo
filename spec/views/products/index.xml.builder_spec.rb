require 'spec_helper'

describe "products/index.xml.builder" do
  before do
    @product_1 = Factory :product, :code => "A", :description => "Foo", :price => "1.99"
    @product_2 = Factory :product, :code => "B", :description => "Bar", :price => "3.99"
    assigns[:products] = [@product_1, @product_2]
    render "/products/index.xml.builder"
  end

  it "renders a list of products" do
    response.should have_tag("products") do
      with_tag "link[rel=latest][method=get][href=#{products_url}]"
      with_tag "product", :count => 2
      with_tag "product:first-of-type" do
        with_tag "link[rel=view][method=get][href=#{product_url(@product_1)}]"
        with_tag "code", :text => @product_1.code
        with_tag "description", :text => @product_1.description
        with_tag "price", :text => number_to_currency(@product_1.price, :unit => "")
      end
      with_tag "product:last-of-type" do
        with_tag "link[rel=view][method=get][href=#{product_url(@product_2)}]"
        with_tag "code", :text => @product_2.code
        with_tag "description", :text => @product_2.description
        with_tag "price", :text => number_to_currency(@product_2.price, :unit => "")
      end
    end
  end
end
