FactoryBot.define do
  factory :item do
    title { Faker::Name.last_name }
    detail { Faker::Markdown.random }
    condition_id { 2 }
    delivery_fee_id { 2 }
    prefecture_id { 2 }
    delivery_day_id { 2 }
    category_id { 2 }
    price { 1000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/download.jpg'), filename: 'download.jpg')
    end
  end
end
