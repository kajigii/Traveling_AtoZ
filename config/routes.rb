Rails.application.routes.draw do
  devise_for :users
  get 'addresses/index'
  root to: "addresses#index"
  
  resources :users, only: [:edit, :update]
  resources :addresses
  # create_and_calculate アクション用のカスタムルートを追加
  post 'create_and_calculate', to: 'addresses#create_and_calculate'
end
