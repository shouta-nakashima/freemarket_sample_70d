require 'rails_helper'
describe Item do
  describe '#create' do
    # 1. 全てのカラムが存在すれば登録できること
    it "全てのカラムのvalidationをクリアできれば登録できる" do
      item = build(:item)
      expect(item).to be_valid
    end

    # 2. nameが空では登録できないこと
    it "nameが空白だと登録できない" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    # 3. introductionが空では登録できないこと
    it "introductionが空だと登録できない " do
      item = build(:item, introduction: nil)
      item.valid?
      expect(item.errors[:introduction]).to include("を入力してください")
    end

    # 4. categoryが空では登録できないこと
    it "category_idが空だと登録できない " do
      user = build(:item, category_id: nil)
      user.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    # 5. conditionが空では登録できないこと
    it "item_condition_idが空白だと登録できない" do
      item = build(:item, item_condition_id: nil)
      item.valid?
      expect(item.errors[:item_condition_id]).to include("を入力してください")
    end

    # 6. postage_payer_idが空では登録できないこと
    it "postage_payer_idが空白だと登録できない" do
      item = build(:item, postage_payer_id: nil)
      item.valid?
      expect(item.errors[:postage_payer_id]).to include("を入力してください")
    end

    # 7. prefecture_codeが空では登録できないこと
    it "prefecture_code_idが空白だと登録できない" do
      item = build(:item, prefecture_code_id: nil)
      item.valid?
      expect(item.errors[:prefecture_code_id]).to include("を入力してください")
    end

    # 8. preparation_dayが空では登録できないこと
    it "preparation_day_idが空白だと登録できない" do
      item = build(:item, preparation_day_id: nil)
      item.valid?
      expect(item.errors[:preparation_day_id]).to include("を入力してください")
    end

    # 9. priceが空では登録できないこと
    it "priceが空白だと登録できない" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end
  end
end