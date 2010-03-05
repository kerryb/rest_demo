require File.dirname(__FILE__) + "/../spec_helper"

describe "Orders routing" do
  it { should route(:get, "/orders").to(:controller => "orders", :action => "index")}
  it { should route(:post, "/orders").to(:controller => "orders", :action => "create")}
  it { should route(:get, "/orders/1").to(:controller => "orders", :action => "show", :id => "1")}
end
