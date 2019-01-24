FactoryBot.define do
  factory :transaction do
    invoice
    credit_card_number { rand(1000000000000000..9000000000000000) }
    credit_card_expiration_date { "2019-01-23" }
    result { 'success' }
  end
end
