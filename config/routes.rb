Rails.application.routes.draw do

  get 'users/secret'
  devise_for :users, controllers: { registrations: "registrations" }

  resources :events
  resources :users, except: [:new, :create, :destroy, :index]
  root "events#index"
end
