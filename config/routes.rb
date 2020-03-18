Rails.application.routes.draw do
  # get 'card/new'
  # get 'card/show'
  devise_for :users
  root to: 'home#index'
  resources :items, only: [:new, :create, :destroy, :show, :edit, :update]
  resources :users, only: [:index, :new, :create, :destroy, :show] 

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end







