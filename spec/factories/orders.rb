FactoryBot.define do
  factory :order do
    post_code {'123-4567'}
    area_id {'2'}
    city { Faker::Address.street_name }
    address { Faker::Address.street_address }
    build {'tech301'}
    phone {'09012345678'}
    association :management
  end
end
