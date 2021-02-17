FactoryBot.define do
  factory :order_address do
    address_number { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    house_number { '1-1' }
    building { '青山マンション' }
    tel { 0o0000002000 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
