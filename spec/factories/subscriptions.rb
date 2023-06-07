FactoryBot.define do
  factory :subscription do
    title { Faker::Fantasy::Tolkien.poem }
    price { Faker::Number.decimal(l_digits: 2) }
    association :customer
  end
end
