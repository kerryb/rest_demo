require 'spec_helper'

include ActionController::UrlWriter
default_url_options[:host] = "test.host"

describe Order do
  it {should have_db_column(:created_at).of_type(:datetime)}
  it {should have_db_column(:updated_at).of_type(:datetime)}
  it {should have_many :order_lines}

  describe "creating from XML" do
    describe "with valid XML" do
      before do
        @product_1 = Factory :product
        @product_2 = Factory :product
        @xml = <<-"EOF"
        <order>
          <line>
            <product>#{product_url(@product_1)}</product>
            <quantity>1</quantity>
          </line>
          <line>
            <product>#{product_url(@product_2)}</product>
            <quantity>2</quantity>
          </line>
        </order>")
        EOF
        @order = Order.create_from_xml @xml
      end

      it "creates and returns an order" do
        @order.should_not be_new_record
      end

      it "adds order lines" do
        @order.order_lines.map{|l| [l.product, l.quantity]}.should =~ [
          [@product_1, 1],
          [@product_2, 2]
        ]
      end
    end

    describe "with invalid XML" do
      it "returns nil" do
        Order.create_from_xml("This is not XML").should be_nil
      end
    end
  end
end
