shared_examples_for "an error" do
  it "returns a content-type of application/vnd.rest-example.error+xml" do
    response.content_type.should == "application/vnd.rest-example.error+xml"
  end

  it "renders the error template" do
    response.should render_template('/error.xml.builder')
  end
end
