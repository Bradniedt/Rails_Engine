FactoryBot.define do
  factory :invoice_item do
    item
    invoice
    quantity { rand(1..20) }
    unit_price { rand(100..1000) }
  end
end
