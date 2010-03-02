require 'spec_helper'

describe "home/index.xml.builder" do
  before do
    render "/home/index.xml.builder"
    @doc = Nokogiri::XML(response.body)
  end

  it "renders a store document" do
    response.should have_tag("store")
  end

  it "renders a products link" do
    response.should have_tag("link[rel=products][method=get][href=#{products_url}]")
  end

  it "renders an orders link" do
    pending do
      response.should have_tag("link[rel=orders][method=get][href=#{orders_url}]")
    end
  end
end
