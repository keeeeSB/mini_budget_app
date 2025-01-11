FactoryBot.define do
  factory :entry do
    date { "Wed, 01 Jan 2025" }
    amount { "1000" }
    description { "今月はエアコンを多く使った。" }
    association :user
  end
end
