FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    price{Faker::Number.between(from: 300, to: 9999999)}
    explain{Faker::Lorem.sentence}
    category_id{Faker::Number.between(from: 1, to: 10)}
    state_id{Faker::Number.between(from: 1, to: 10)}
    fee_id{Faker::Number.between(from: 1, to: 10)}
    place_id{Faker::Number.between(from: 1, to: 10)}
    dispatch_id{Faker::Number.between(from: 1, to: 10)}
    association :user
  end
end