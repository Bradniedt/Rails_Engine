FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "item#{n}" }
    sequence(:description) { |n| "a cool item #{n}" }
    unit_price { rand(100..1000) }
    merchant
  end
end
