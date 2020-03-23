class Item < ApplicationRecord

  has_one :card

  # Itemモデルで 「購入者」「出品者」を取り出せるようにする。
  # userテーブルの「id」とitemsテーブルの「buyer_id」「saler_id」が紐づく
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"

end
