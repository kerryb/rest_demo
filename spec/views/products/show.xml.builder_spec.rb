require 'spec_helper'

describe "products/show.xml.builder" do
  before do
    @product = Factory(:product, :code => "A", :description => "Foo", :price => "1.99")
    assigns[:product] = @product
    render "/products/show.xml.builder"
  end

  it "renders a product" do
    response.should have_tag("product") do
      with_tag "link[rel=latest][method=get][href=#{product_url(@product)}]"
      with_tag "code", :text => @product.code
      with_tag "description", :text => @product.description
      with_tag "price", :text => number_to_currency(@product.price, :unit => "")
    end
  end
end
