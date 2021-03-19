FactoryBot.define do
  factory :item do
    name              { Faker::Lorem.word }
    explanation       { Faker::Lorem.sentences }
    category_id       { 2 }
    condition_id      { 2 }
    postage_id        { 2 }
    sender_area_id    { 2 }
    required_time_id  { 2 }
    price             { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image_png')
    end
  end
end
