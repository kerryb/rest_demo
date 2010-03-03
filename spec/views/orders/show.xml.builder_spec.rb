require 'spec_helper'

describe "orders/show.xml.builder" do
  before do
    render "/orders/show.xml.builder"
  end

  it "renders an order document" do
    response.should have_tag("order")
  end
end
