ActionController::Routing::Routes.draw do |map|
  map.resources :products, :only => :index
end
