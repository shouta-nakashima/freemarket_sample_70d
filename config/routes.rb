Rails.application.routes.draw do
  root to: 'users#index'
  resources :users, only: [:index, :new, :create, :destroy, :show] do
    resources :cards, only: [:index, :new, :create, :destroy, :edit, :update]
    resources :plofiles, only: [:new, :create]
    resources :destinations, only: [:edit, :update]
  end
  resources :items, only: [:index, :new, :create, :destroy, :show,:edit]
end
