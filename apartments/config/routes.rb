Rails.application.routes.draw do
root :to => redirect('/homepage')
resources :buildings
resources :users

match '/homepage', to: 'homepages#index', via: :get

match '/login', to: 'sessions#new', via: :get
match '/login_create', to: 'sessions#create', via: :post
match '/logout', to: 'sessions#destroy', via: :delete

end
