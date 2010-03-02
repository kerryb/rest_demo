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

  describe "requesting show" do
    before do
      @product = Factory(:product)
      get :show, :id => @product.id
    end

    it "assigns the product for the view" do
      assigns[:product].should == @product
    end

    it "renders the show view" do
      response.should render_template("show.xml.builder")
    end

    it "returns a content-type of application/vnd.rest-example.product+xml" do
      response.content_type.should == "application/vnd.rest-example.product+xml"
    end

    it "returns a status of 200" do
      response.response_code.should == 200
    end
  end
end
