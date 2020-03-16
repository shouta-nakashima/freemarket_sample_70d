Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :signup do
    collection do
      get 'top'
      get 'second'
      get 'third'
      get 'done'
    end
  end
  resources :users, only: [:index, :new, :create, :destroy, :show] do
    resources :cards, only: [:index, :new, :create, :destroy, :edit, :update]
  end
  resources :items, only: [:index, :new, :create, :destroy, :show,:edit]
end
