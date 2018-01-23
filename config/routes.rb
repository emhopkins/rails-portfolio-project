Rails.application.routes.draw do

  get 'landlords/:id/can_house_more_than_3_tenants', :to => 'landlords#can_house_more_than_3_tenants', :as => :can_house_more_than_3_tenants
  get '/landlords/all', :to => 'landlords#all', :as => :all
  post 'landlords/:id/buildings/new', :to => 'buildings#create'

  resources :landlords do
  	resources :buildings do 
  	  resources :apartments, only: [:can_house_more_than_3_tenants]
    end
  end
  resources :tenants
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'home#index'
end
