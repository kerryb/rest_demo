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
      post :create
    end

    describe "when creation succeeds" do
      it "renders the show view" do
        response.should render_template("show.xml.builder")
      end

      it "returns a content-type of application/vnd.rest-example.order+xml" do
        response.content_type.should == "application/vnd.rest-example.order+xml"
      end

      it "returns a status of 201" do
        response.response_code.should == 201
      end

      it "returns a Location header"
    end
  end
end
