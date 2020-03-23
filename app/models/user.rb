class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :email, presence: true
  validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :password, length: { minimum: 7 }
  validates :first_name, :family_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠]+\z/i }
  validates :first_name_kana, :family_name_kana, presence: true, format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/i }


  #associate
  has_one :card
  has_many :items

  # itemsテーブルの「buyer_id」(購入者)とuserの「id」と紐かせることで、userが買った商品を全て取り出す
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"

  # 「購入者(buyer_id)がまだ存在しない商品」であり、かつ、saler_idがuserのidと紐づいている商品 「buyer_idがNULLのとき」
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"

  # 購入者(buyer_id)が既に存在している商品」であり、かつ、saler_idがuserのidと紐づいている商品 「buyer_idがNULLではないとき」
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"

end