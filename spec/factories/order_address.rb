FactoryBot.define do
  factory :order_address do
    address_number { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    house_number { '1-1' }
    tel { 00000002000 }
  end
end