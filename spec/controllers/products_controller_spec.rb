require 'spec_helper'

describe ProductsController do
  describe "requesting index" do
    before do
      @products = [Factory(:product), Factory(:product)]
      get :index
    end

    it "assigns a list of all products for the view" do
      assigns[:products].should == @products
    end

    it "renders the index view" do
      response.should render_template("index.xml.builder")
    end

    it "returns a content-type of application/vnd.rest-example.products+xml" do
      response.content_type.should == "application/vnd.rest-example.products+xml"
    end

    it "returns a status of 200" do
      response.response_code.should == 200
    end
  end
end
