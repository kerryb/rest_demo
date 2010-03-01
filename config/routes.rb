ActionController::Routing::Routes.draw do |map|
  map.root :controller => :home
  map.resources :products, :only => [:index, :show]
end
