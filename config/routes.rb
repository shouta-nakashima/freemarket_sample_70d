Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'destinations', to: 'users/registrations#new_destination'
    post 'destinations', to: 'users/registrations#create_destination'
  end

  root to: "home#index"
<<<<<<< HEAD

  resources :home, only: [:index, :new]

　resources :items, only: [:index, :new, :create, :update, :destroy, :show, :edit]
  resources :users, only: [:index, :new, :create, :destroy, :show]
  resources:cards, only: [:index, :new, :create, :destroy, :edit, :update]


=======
  resources :users, only: [:index, :new, :create, :destroy, :show] do
    resources:cards, only: [:index, :new, :create, :destroy, :edit, :update]
  end



  resources :items, only: [:new, :create, :destroy, :show, :edit, :update]
>>>>>>> parent of 8defa05... home_ancestry_commit
end
