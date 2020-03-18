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


end