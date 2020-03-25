class CardController < ApplicationController

  require "payjp"


  #usersテーブルでのidカラムの値が1のアカウントでログインしている場合、current_userはUser.find(1)と同じ意味
  #current_user.usersテーブルのカラム名とすることで、ログイン中のユーザーの情報として登録されている各カラムの値を取得することができる。
  #ヘルパーメソッドcurrent_userを利用して、ログインしているユーザーのデータ(id)を取得してuser_idとする
  #if card.exists? カードテーブルにデータが存在するかどうかtrueならリダイレクト
 
 
  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end



  #payjpとCardのデータベース作成

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト',
      email: current_user.email,
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end



#PayjpとCardデータベースを削除します

  def delete
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end




  #Cardのデータpayjpに送り情報を取り出します

  def show
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
end