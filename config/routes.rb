Rails.application.routes.draw do

  get 'users/secret'
  devise_for :users, controllers: { registrations: "registrations" }

  resources :events do
  	resources :attandances
  end
  	
  resources :users, except: [:new, :create, :destroy, :index] 
  resources :charges
  root "events#index"
end
