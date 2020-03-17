Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :users, only: [:index, :new, :create, :destroy, :show] 
  resources :cards, only: [:index, :new, :create, :destroy, :edit, :update] 
  resources :items, only: [:new, :create, :destroy, :show, :edit, :update]
end
