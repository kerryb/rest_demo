require 'spec_helper'

describe Order do
  it {should have_db_column(:created_at).of_type(:datetime)}
  it {should have_db_column(:updated_at).of_type(:datetime)}
  it {should have_many :order_lines}

  describe "creating from XML" do
    before do
      stub(Order).create
    end

    describe "with valid XML" do
      it "creates an order" do
        Order.create_from_xml("<order></order>")
        Order.should have_received.create
      end
    end

    describe "with invalid XML" do
      it "returns nil" do
        Order.create_from_xml("This is not XML").should be_nil
      end
    end
  end
end
