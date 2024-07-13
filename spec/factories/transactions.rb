FactoryBot.define do
  factory :transaction do
    action { :buy }
    association :user
    association :pokemon
  end
end