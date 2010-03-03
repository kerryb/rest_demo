require 'spec_helper'

describe "orders/index.xml.builder" do
  before do
    render "/orders/index.xml.builder"
  end

  it "renders an orders document" do
    response.should have_tag("orders") do
      with_tag("link[rel=latest][method=get][href=#{orders_url}]")
      with_tag("link[rel=new][method=post][type=application/vnd.rest-example.order+xml][href=#{orders_url}]")
    end
  end
end
