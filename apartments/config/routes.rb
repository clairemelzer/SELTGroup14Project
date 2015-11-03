Rails.application.routes.draw do

resources :buildings
resources :users

match '/homepage', to: 'homepages#index', via: :get

end
