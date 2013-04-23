SampleApp::Application.routes.draw do
  resources :hardwares
  resources :parameters
  resources :keys
  resources :positions
  resources :locations
  resources :purchases
  resources :users
  resources :sessions,    only: [:new, :create, :destroy]

  resources :datacenters do
    resources :server_racks do
      resources :rack_units
    end
  end

  root to: 'static_pages#home'

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
end
