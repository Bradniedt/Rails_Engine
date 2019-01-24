FactoryBot.define do
  factory :item do
    name { |n| "item#{n}" }
    description { |n| "a cool item#{n}" }
    unit_price { rand(100..1000) }
    merchant
  end
end
