FactoryBot.define do
  factory :item do
    association :user
    name             {Faker::Name.name}
    price            {Faker::Commerce.price(range: 333..9999999)}
    description      {Faker::Lorem.sentence}
    burden_id        {Faker::Number.between(from: 2, to: 3)}
    days_id          {Faker::Number.between(from: 2, to: 4)}
    prefecture_id    {Faker::Number.between(from: 2, to: 48)}
    category_id      {Faker::Number.between(from: 2, to: 11)}
    condition_id     {Faker::Number.between(from: 2, to: 7)}
  end
  
end