FactoryBot.define do
  factory :purchase_address do
    postcode { '111-1111' }
    prefecture_id { 2 }
    municipality { '東京' }
    address { '1-1' }
    building_name { 'フリマビル' }
    phone_number { '08012345678' }
    token { 'token1111' }
  end
end
