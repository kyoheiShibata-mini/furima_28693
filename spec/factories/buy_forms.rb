FactoryBot.define do
  factory :buy_form do
    postal {Faker::Number.leading_zero_number(digits: 3)+"-"+Faker::Number.leading_zero_number(digits: 4)}
    prefecture_id{Faker::Number.between(from: 1, to: 47)}
    city{Faker::Address.city}
    address{Faker::Address.street_address}
    tel{Faker::Number.leading_zero_number(digits: 11)}
    user_id{Faker::Number.number}
    item_id{Faker::Number.number}
    token{Faker::Number.leading_zero_number(digits: 16)}
  end
end
