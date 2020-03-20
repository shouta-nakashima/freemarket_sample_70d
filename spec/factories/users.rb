FactoryBot.define do

  factory :user do

    nickname              {"abe"}
    email                 {"kkk@email.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"田中"}
    first_name_kana       {"カタカナ"}
    family_name             {"隆"}
    family_name_kana        {"カタカナ"}
    birth_year            {"2020"}
    birth_month           {"1"}
    birth_day             {"1"}


  end

end