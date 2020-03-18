Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  # get 'card/new'
  # get 'card/show'
  devise_for :users
  root to: 'home#index'
  resources :items, only: [:new, :create, :destroy, :show, :edit, :update]
  resources :users, only: [:index, :new, :create, :destroy, :show] 


  #クレジットカード登録、表示、削除
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

#クレジットカードでの購入 

  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end

end







