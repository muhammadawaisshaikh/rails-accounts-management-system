Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  # root route
  root 'dashboard#index'

  # all resources
  resources :journal
  resources :product
  resources :vendor
  resources :order
  resources :dashboard
  resources :sales
  resources :payment
  
end
