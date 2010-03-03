require 'spec_helper'

describe "orders/index.xml.builder" do
  before do
    render "/orders/index.xml.builder"
    @doc = Nokogiri::XML(response.body)
  end

  it "renders an orders element with a URI" do
    @doc.xpath("/orders/@self").text.should == orders_url
  end

  it "renders a 'new' link" do
    response.should have_tag("link[rel=new][method=post][type=application/vnd.rest-example.order+xml][href=#{orders_url}]")
  end
end
