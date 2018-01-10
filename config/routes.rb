Rails.application.routes.draw do
  resources :landlords do
  	resources :buildings do 
  	  resources :apartments, only: [:can_house_more_than_3_tenants]
    end
  end
  resources :tenants
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  get 'landlords/:id/can_house_more_than_3_tenants', :to => 'landlords#can_house_more_than_3_tenants', :as => :can_house_more_than_3_tenants
  post 'landlords/:id/buildings/new', :to => 'buildings#create'
  root 'home#index'
end
