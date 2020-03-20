FactoryBot.define do
  factory :address do
    d_first_name { "悟空" }
    d_family_name { "孫" }
    d_first_name_kana { "ゴクウ" }
    d_family_name_kana { "ソン" }
    post_code { "1111111" }
    prefecture_code { 1 }
    city { "豊島区" }
    house_number { "三角町" }
  end
end