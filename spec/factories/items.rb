FactoryBot.define do
  factory :item do
    title {Faker::Lorem.sentence}
    concept {Faker::Lorem.sentence}
    category_id {'2'}
    situation_id {'2'}
    delivery_price_id {'2'}
    area_id {'2'}
    delivery_date_id {'2'}
    price {'1000'}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
