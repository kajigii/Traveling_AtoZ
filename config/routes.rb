Rails.application.routes.draw do
  get 'addresses/index'
  root "addresses#index"
end
