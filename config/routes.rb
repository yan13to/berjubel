ActionController::Routing::Routes.draw do |map|
  map.register "register", :controller => "users", :action => "new", :method => :get
  map.login "login", :controller => "sessions", :action => "new", :method => :get
  map.logout "logout", :controller => "sessions", :action => "destroy", :method => :delete
  map.forgot_password "forgot_password", :controller => "users", :action => "forgot_password", :method => :get
  map.select_a_category "items/:tid/category/:id", :controller => "items", :action => "category", :method => :get, :requirements => {:tid => /search|browse/i}

  map.resources :sessions
  map.resources :users
  map.resources :uploader
  
  map.resources :items, :collection => {:category => :get}

  map.root :controller => "home"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
