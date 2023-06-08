FactoryBot.define do
  factory :tea do
    title { Faker::Tea.unique.variety }
    description { Faker::Hipster.sentence }
    temperature { Faker::Number.between(from: 40, to: 180) }
    brew_time { Faker::Number.within(range: 1..10) }
  end
end
