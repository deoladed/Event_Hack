Rails.application.routes.draw do

  get 'attandances/index'
  get 'attandances/new'
  get 'users/secret'
  devise_for :users, controllers: { registrations: "registrations" }

  resources :events
  resources :users, except: [:new, :create, :destroy, :index]
  resources :charges
  resources :attandances
  root "events#index"
end
