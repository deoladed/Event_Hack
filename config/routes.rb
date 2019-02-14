Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }

  resources :events do
  	resources :attandances
    resources :event_pictures, only: [:create]
  end
  	
  resources :users, except: [:new, :create, :destroy, :index] do
  	resources :avatars, only: [:create]
  end
  resources :charges
  root "events#index"
end
