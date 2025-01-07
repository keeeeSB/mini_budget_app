FactoryBot.define do
  factory :entry do
    date { "2025-01-07" }
    amount { "9.99" }
    description { "MyText" }
    user { nil }
  end
end
