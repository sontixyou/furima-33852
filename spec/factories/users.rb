FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name  {"太郎"}
    last_name {"鈴木"}
    first_name_furigana {"タロウ"}
    last_name_furigana {"スズキ"}
    birthday {'1990/09/01'}

  end
end 