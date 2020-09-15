FactoryBot.define do
  factory :item do
    name { Faker::Name.initials(number: 2)}
    price {350}
    content {'hogehoge'}
    shipping_cost_id {2}
    shipping_day_id {2}
    prefecture_id {2}
    judgment_id {3}
    category_id {3}
    user_id {1}
    association :user
  end
end
