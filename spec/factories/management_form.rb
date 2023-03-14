FactoryBot.define do
  factory :management_form do
    post_code {'123-4567'}
    area_id {'2'}
    city { Faker::Address.street_name }
    address { Faker::Address.street_address }
    build {'tech301'}
    phone {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
