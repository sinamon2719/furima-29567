FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"0000000a"}
    password_confirmation {"0000000a"}
    family_name {'田中'}
    first_name {'太郎'}
    family_name_kana {'タナカ'}
    first_name_kana {'タロウ'}
    birth_day {'2020-09-11'}
  end
end
