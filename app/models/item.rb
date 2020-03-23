class Item < ApplicationRecord


  has_one :card

  # Itemモデルで 「購入者」「出品者」を取り出せるようにする。
  # userテーブルの「id」とitemsテーブルの「buyer_id」「saler_id」が紐づく
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"

end

  # include JpPrefecture
  # jp_prefecture :prefecture_code
  belongs_to :user, optional:true

 

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :prefecture_code
end

