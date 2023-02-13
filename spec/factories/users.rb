FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}

    japanese_user = Gimei.name

    first_name { japanese_user.first.kanji }
    first_name_kana { japanese_user.first.katakana }
    last_name { japanese_user.last.kanji }
    last_name_kana { japanese_user.last.katakana }

    birthday {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end