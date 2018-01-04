Rails.application.routes.draw do
  resources :apartments
  resources :buildings
  resources :tenants
  resources :landlords
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  root 'home#index'
  # get '/users/sign_out' => 'home#index'
end
