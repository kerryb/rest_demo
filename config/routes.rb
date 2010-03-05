ActionController::Routing::Routes.draw do |map|
  map.root :controller => :home
  map.resources :products, :only => [:index, :show]
  map.resources :orders, :only => [:index, :show, :create]
end
