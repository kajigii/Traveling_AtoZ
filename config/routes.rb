Rails.application.routes.draw do
  devise_for :users
  get 'addresses/index'
  root to: "addresses#index"

  
  resources :users, only: [:edit, :update]
  resources :addresses, only: [:index, :new, :create]

end
