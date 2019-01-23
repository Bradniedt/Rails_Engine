FactoryBot.define do
  factory :invoice do
    customer { rand(1..1000) }
    merchant { rand(1..1000) }
  end
end
