require 'spec_helper'

describe OrdersController do
  describe "requesting index" do
    before do
      get :index
    end

    it "renders the index view" do
      response.should render_template("index.xml.builder")
    end

    it "returns a content-type of application/vnd.rest-example.orders+xml" do
      response.content_type.should == "application/vnd.rest-example.orders+xml"
    end

    it "returns a status of 200" do
      response.response_code.should == 200
    end
  end

  describe "requesting create" do
    before do
      @xml = "<order/>"
      stub(Order).create_from_xml
    end

    it "creates an order from the XML in the request body" do
      post_with_body :create, @xml
      Order.should have_received.create_from_xml(@xml)
    end

    describe "when creation succeeds" do
      before do
        @order = Order.new
        stub(@order).id {123}
        stub(Order).create_from_xml {@order}
        post_with_body :create, @xml
      end

      it "renders the show view" do
        response.should render_template("show.xml.builder")
      end

      it "returns a content-type of application/vnd.rest-example.order+xml" do
        response.content_type.should == "application/vnd.rest-example.order+xml"
      end

      it "returns a status of 201" do
        response.response_code.should == 201
      end

      it "returns a Location header for the new order" do
        response.headers["Location"].should == order_url(@order)
      end
    end

    describe "when creation fails" do
      before do
        stub(Order).create_from_xml {nil}
        post_with_body :create, @xml
      end

      it "returns a status of 400" do
        response.response_code.should == 400
      end

      it_should_behave_like "an error"
    end
  end
end
