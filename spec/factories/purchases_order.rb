FactoryBot.define do
  factory :purchase_order do
    #association :order
    postal_code   {"564-0004"}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city          {"吹田市"}
    address       {"原町4-5-16"}
    building      {"伊藤荘301"}
    phone_number  {Faker::Number.number(digits: 11)}
    token         {"whook_dc71665a88e75ae33805e4b720"}
  end
end