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
  validates :first_name, :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana, :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :birth_year, length: { minimum: 4 }, format: { with: /\A[0-9]+\z/},inclusion: {in: 1910..2030}
  validates :birth_month, format: { with: /\A[0-9]+\z/},inclusion: {in: 1..12}
  validates :birth_day, format: { with: /\A[0-9]+\z/},inclusion: {in: 1..31}
  has_many :items
  has_one :destination
end
