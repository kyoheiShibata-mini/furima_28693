FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 8)}
    password_confirmation {password}
    first_name {"柴田"}
    second_name {"郷平"}
    first_kana {"シバタ"}
    second_kana {"キョウヘイ"}
    birth{Faker::Date.between(from: '1960-01-01',to: '2019-12-31')}
  end
end