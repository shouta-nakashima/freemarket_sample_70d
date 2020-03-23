class Item < ApplicationRecord
  # include JpPrefecture
  # jp_prefecture :prefecture_code
  belongs_to :user, optional:true

  # belongs_to :seller, class_name: "User",foreign_key: 'user_id'
  # belongs_to :buyer, class_name: "User",foreign_key: 'user_id'

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :prefecture_code
end