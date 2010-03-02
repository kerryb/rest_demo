require File.dirname(__FILE__) + "/../spec_helper"

describe "Products routing" do
  it { should route(:get, "/products").to(:controller => "products", :action => "index")}
  it { should route(:get, "/products/1").to(:controller => "products", :action => "show", :id => "1")}
end
