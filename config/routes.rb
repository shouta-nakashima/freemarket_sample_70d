Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'destinations', to: 'users/registrations#new_destination'
    post 'destinations', to: 'users/registrations#create_destination'
  end
  root to: "home#index"
  resources :users, only: [:index, :new, :create, :destroy, :show] do
    resources:cards, only: [:index, :new, :create, :destroy, :edit, :update]
  end



  resources :items, only: [:new, :create, :destroy, :show, :edit, :update]
end
