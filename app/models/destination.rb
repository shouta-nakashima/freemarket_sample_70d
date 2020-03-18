class Destination < ApplicationRecord
  belongs_to :user, optional: true
  validates :d_first_name, :d_family_name, presence: true, format: { with: /\A[ぁ-んァ-ヶー一-龠]+\z/i }
  validates :d_first_name_kana, :d_family_name_kana, presence: true, format: { with: /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/i }
  validates :post_code,:prefecture_code,:city,:house_number, presence: true
  validates :phone_number, uniqueness: true
end
