FactoryBot.define do
  factory :entry do
    date { "2025-01-07" }
    amount { "1000" }
    description { "今月はエアコンを多く使った。" }
    association :user
  end
end
