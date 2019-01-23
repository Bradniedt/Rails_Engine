FactoryBot.define do
  factory :item do
    name { "" }
    description { "" }
    unit_price { rand(100..1000) }
    merchant
  end
end
