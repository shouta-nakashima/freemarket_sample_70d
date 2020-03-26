class PurchaseController < ApplicationController
  before_action :set_item

  require 'payjp'



  def index
    @image = @item.images.includes(:item)
    card = Card.where(user_id: current_user.id).first  #cardsテーブルからpayjpの顧客IDを検索
    if card.blank?
      redirect_to controller: "card", action: "new"  #登録された情報がない時はカード登録画面に移動
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)  #保管した顧客IDでpayjpから情報取得 retrieve:取り戻す
      @default_card_information = customer.cards.retrieve(card.card_id)  #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
    end
  end




  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount: @item.price,          #支払金額を入力
    customer: card.customer_id,   #顧客ID
    currency: 'jpy',              #日本円
  )
  @item_buyer = Item.find(params[:id])
  @item_buyer.update!(buyer_id: current_user.id)
  redirect_to root_path
  end



private

  def set_item
    @item = Item.find(params[:id])
  end


end
