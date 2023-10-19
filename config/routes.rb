Rails.application.routes.draw do
  get 'addresses/index'
  devise_for :users
  root "addresses#index"
end
