class Item < ApplicationRecord
  validates :images,              presence: true
  validates :name,                presence: true, length: { maximum: 40 }
  validates :introduction,        presence: true, length: { maximum: 1000 }
  validates :price,               presence: true, inclusion: 300..9999999
  validates :postage_payer_id,    presence: true
  validates :preparation_day_id,  presence: true
  validates :item_condition_id,   presence: true
  validates :category_id,         presence: true
  validates :prefecture_code_id,  presence: true


  has_one :card


  # Itemモデルで 「購入者」「出品者」を取り出せるようにする。
  # userテーブルの「id」とitemsテーブルの「buyer_id」「saler_id」が紐づく
  # belongs_to :seller, class_name: "User"
  # belongs_to :buyer, class_name: "User"

  # include JpPrefecture
  # jp_prefecture :prefecture_code
  belongs_to :user, optional:true
  belongs_to :category
  belongs_to :seller, class_name: "User",foreign_key: 'seller_id'
  # belongs_to :buyer, class_name: "User",foreign_key: 'buyer_id'



  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :prefecture_code
  
end

