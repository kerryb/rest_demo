require File.dirname(__FILE__) + "/../spec_helper"

describe "Home page routing" do
  it { should route(:get, "/").to(:controller => "home", :action => "index")}
end
