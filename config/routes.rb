Rails.application.routes.draw do

  # root route
  root 'journal#index'

  # all resources
  resources :journal
  resources :product
end
