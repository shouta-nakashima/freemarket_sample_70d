class Destination < ApplicationRecord
  belongs_to :user, optional: true
  validates :d_first_name, :d_family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :d_first_name_kana, :d_family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :post_code,:prefecture_code,:city,:house_number, presence: true
  validates :post_code, format: { with: /\A\d{7}\z/}
end
