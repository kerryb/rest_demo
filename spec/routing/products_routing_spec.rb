require File.dirname(__FILE__) + '/../spec_helper'

describe 'Products routing' do
  it { should route(:get, '/products').to(:controller => 'products', :action => 'index')}
end
