FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.middle_name}
    email                 {Faker::Internet.email}
    password              {"1234abcd"}
    password_confirmation {"1234abcd"}
    family_name           {"伊藤"}
    first_name            {"紗織"}
    family_name_kana      {"イトウ"}
    first_name_kana       {"サオリ"}
    birth_day             {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end
