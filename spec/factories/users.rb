FactoryBot.define do
  factory :user do
    nickname              {"あべ"}
    email                 {"kkk@gmail.com"}
    password              {"00000a"}
    password_confirmation {password}
    first_name            {"山田"}
    last_name             {"太郎"}
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"タロウ"}
    birthday              {Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today)}
  end
end