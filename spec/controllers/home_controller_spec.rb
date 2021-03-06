require 'spec_helper'

describe HomeController do
  describe "requesting index" do
    before do
      get :index
    end

    it "renders the index view" do
      response.should render_template("index.xml.builder")
    end

    it "returns a content-type of application/vnd.rest-example.home+xml" do
      response.content_type.should == "application/vnd.rest-example.home+xml"
    end

    it "returns a status of 200" do
      response.response_code.should == 200
    end
  end
end
