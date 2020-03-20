# require 'rails_helper'

# describe Destination do
#   describe '#create' do
#     #1,prefecture_code,city, house_number, post_code, d_first_name, d_family_name, d_first_name_kana, d_family_name_kanaが存在すれば登録できること
#     it "is valid with a prefecture_code,city, house_number, post_code, d_first_name, d_family_name, d_first_name_kana, d_family_name_kana " do
#       destination = build(:destination)
#       expect(destination).to be_valid
#   end

#     # 2. prefecture_codeが空では登録できないこと
#     it "is invalid without a prefecture_code" do
#       destination = build(:destination, prefecture_code: nil)
#       destination.valid?
#       expect(destination.errors[:prefecture_code]).to include("を入力してください")
#     end

#     # 3. cityが空では登録できないこと
#     it "is invalid without a city" do
#       destination = build(:destination, city: nil)
#       destination.valid?
#       expect(destination.errors[:city]).to include("を入力してください")
#     end

#     # 4. house_numberが空では登録できないこと
#     it "is invalid without a house_number" do
#       destination = build(:destination, house_number: nil)
#       destination.valid?
#       expect(destination.errors[:house_number]).to include("を入力してください")
#     end

#     #5. post_codeが空では登録できないこと
#     it "is invalid without a post_code" do
#       destination = build(:destination, post_code: nil)
#       destination.valid?
#       expect(destination.errors[:post_code]).to include("を入力してください")
#     end

#     # 3. d_first_nameが空では登録できないこと
#     it "is invalid without a d_first_name" do
#       destination = build(:destination, d_first_name: nil)
#       destination.valid?
#       expect(destination.errors[:d_first_name]).to include("を入力してください")
#     end

#     # 3. d_family_nameが空では登録できないこと
#     it "is invalid without a d_family_name" do
#       destination = build(:destination, d_family_name: nil)
#       destination.valid?
#       expect(destination.errors[:d_family_name]).to include("を入力してください")
#     end

#     # 3. d_first_name_kanaが空では登録できないこと
#     it "is invalid without a d_first_name_kana" do
#       destination = build(:destination, d_first_name_kana: nil)
#       destination.valid?
#       expect(destination.errors[:d_first_name_kana]).to include("を入力してください")
#     end

#     # 3. d_family_name_kanaが空では登録できないこと
#     it "is invalid without a d_family_name_kana" do
#       destination = build(:destination, d_family_name_kana: nil)
#       destination.valid?
#       expect(destination.errors[:d_family_name_kana]).to include("を入力してください")
#     end

#     # 6. post_codeがハイフンあり7桁であれば登録できること
#     it "is valid with a post_code 3桁-４桁 " do
#       destination = build(:destination, post_code: "1234567")
#       destination.valid?
#       expect(destination.errors[:post_code]).to include("は半角英数字で入力してください")
#     end
#   end
# end