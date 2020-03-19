class User < ApplicationRecord
  include JpPrefecture
  jp_prefecture :prefecture_code
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :email, presence: true
  validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :password, length: { minimum: 7 }
  validates :first_name, :family_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠]+\z/i }
  validates :first_name_kana, :family_name_kana, presence: true, format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/i }


  has_many :items

  validates :birth_year, length: { minimum: 4 }, format: { with: /\A[+-]?\d+\z/},inclusion: {in: 1910..2030}
  validates :birth_month, format: { with: /\A[+-]?\d+\z/},inclusion: {in: 1..12}
  validates :birth_day, format: { with: /\A[+-]?\d+\z/},inclusion: {in: 1..31}
  has_one :destination

end
