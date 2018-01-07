Rails.application.routes.draw do
  resources :landlords do
  	resources :buildings do 
  	  resources :apartments
    end
  end
  resources :tenants
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  root 'home#index'
  # get '/users/sign_out' => 'home#index'
end
