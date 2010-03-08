require 'spec_helper'

describe "orders/show.xml.builder" do
  before do
    @foo = Factory :product_foo
    @bar = Factory :product_bar
    # TODO do this all with factories
    lines = [
      OrderLine.create(:product => @foo, :quantity => 1),
      OrderLine.create(:product => @bar, :quantity => 2)
    ]
    @order = Order.create :order_lines => lines
    assigns[:order] = @order
    render "/orders/show.xml.builder"
  end

  it "renders an order document" do
    response.should have_tag("order") do
      with_tag("link[rel=latest][method=get][href=#{order_url(@order)}]")
      with_tag("link[rel=cancel][method=delete][href=#{order_url(@order)}]")
      with_tag "line" do
        with_tag "product", :text => product_url(@foo)
        with_tag "quantity", :text => "1"
        with_tag "cost", :text => number_to_currency(@foo.price, :unit => "")
      end
      with_tag "line" do
        with_tag "product", :text => product_url(@bar)
        with_tag "quantity", :text => "2"
        with_tag "cost", :text => number_to_currency(@bar.price * 2, :unit => "")
      end
      with_tag "total", :text => number_to_currency(@foo.price + @bar.price * 2, :unit => "")
    end
  end
end
