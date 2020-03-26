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


  #クレジットカード登録、表示、削除
  # card/newはカード登録画面、'card#pay'はPAYJP登録通信、card/showは登録カード情報表示、'card#delete'は削除ボタン

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end


#クレジットカードでの購入
# 'purchase#index'は購入確認画面、'purchase#pay'はPAYJP購入通信、'purchase#done'支払い完了画面

  resources :purchase, only: [:index] do
    member do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
end