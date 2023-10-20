Rails.application.routes.draw do
  devise_for :users
  get 'addresses/index'
  root "addresses#index"
  resources :users, only: [:edit, :update]
end
