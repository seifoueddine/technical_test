FactoryBot.define do
  factory :pokemon do
    name { Faker::Games::Pokemon.name }
    weight { rand(50..150) }
    height { rand(3..10) }
    price { rand(10.0..50.0).round(2) }
    association :user
  end
end
