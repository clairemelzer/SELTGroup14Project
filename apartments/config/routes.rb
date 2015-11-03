Rails.application.routes.draw do
root :to => redirect('/homepage')
resources :buildings
resources :users

match '/homepage', to: 'homepages#index', via: :get

end
