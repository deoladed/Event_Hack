Rails.application.routes.draw do
  get 'users/show'
  get 'users/secret'
  devise_for :users, controllers: { registrations: "registrations" }
  root "events#index"
end
