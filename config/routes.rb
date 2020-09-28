Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root'items#index'
  get 'items/show'
  get 'order/index'

  resources :items do
    resources :orders, only: [:create, :index]
  end
end