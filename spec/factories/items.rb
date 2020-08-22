FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    price{Faker::Number.between(from: 300, to: 9999999)}
    explain{Faker::Lorem.sentence}
    category_id{Faker::Number.number(digits: 10)}
    state_id{Faker::Number.number(digits: 10)}
    fee_id{Faker::Number.number(digits: 10)}
    place_id{Faker::Number.number(digits: 10)}
    dispatch_id{Faker::Number.number(digits: 10)}
    association :user
  end
end
