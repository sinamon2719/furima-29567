Rails.application.routes.draw do
  devise_for :users
  root'items#index'
  get 'items/show'
  get 'order/index'

  resources :items do
    resources :orders, only: [:create, :index]
  end
end