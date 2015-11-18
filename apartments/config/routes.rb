Rails.application.routes.draw do
    
  resources :buildings do
    resources :apartments do
      resources :reviews
    end
  end
  root :to => redirect('/homepage')
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
    
  match '/homepage', to: 'homepages#index', via: :get
  match '/signup', to: 'users#new', via: :get
  match '/login',  to: 'sessions#new', via: :get
  match '/logout', to: 'sessions#destroy', via: :delete

end
