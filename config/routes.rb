Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'destinations', to: 'users/registrations#new_destination'
    post 'destinations', to: 'users/registrations#create_destination'
  end

  root to: "home#index"

  resources :home, only: [:index, :new]

  resources :items, only: [:index, :new, :create, :update, :destroy, :show, :edit] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :users, only: [:index, :new, :create, :destroy, :show]
  resources:cards, only: [:index, :new, :create, :destroy, :edit, :update]
end
