FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.middle_name}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {Faker::Internet.password(min_length: 6)}
    family_name           {"伊藤"}
    first_name            {"紗織"}
    family_name_kana      {"イトウ"}
    first_name_name       {"サオリ"}
    birth_day             {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end
