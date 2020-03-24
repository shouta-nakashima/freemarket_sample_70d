class User < ApplicationRecord
  include JpPrefecture
  jp_prefecture :prefecture_code
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :email, presence: true
  validates :email, uniqueness: true, format: { with: /\A\S+@\S+\.\S+\z/}
  validates :password, length: { minimum: 7 }

  
  #associate
  has_one :card
  has_many :items

  # itemsテーブルの「buyer_id」(購入者)とuserの「id」と紐かせることで、userが買った商品を全て取り出す
  # has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"

  # # 「購入者(buyer_id)がまだ存在しない商品」であり、かつ、saler_idがuserのidと紐づいている商品 「buyer_idがNULLのとき」
  # has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"

  # # 購入者(buyer_id)が既に存在している商品」であり、かつ、saler_idがuserのidと紐づいている商品 「buyer_idがNULLではないとき」
  # has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"

  
  validates :first_name, :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana, :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :birth_year, length: { minimum: 4 }, format: { with: /\A[0-9]+\z/},inclusion: {in: 1910..2030}
  validates :birth_month, format: { with: /\A[0-9]+\z/},inclusion: {in: 1..12}
  validates :birth_day, format: { with: /\A[0-9]+\z/},inclusion: {in: 1..31}
  has_many :items, dependent: :destroy

  has_one :destination
end

