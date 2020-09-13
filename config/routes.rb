Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  get 'items/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :new, :create, :show] do
  end
  root to: 'items#index'
  resources :articles
end
