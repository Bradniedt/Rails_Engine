require 'rails_helper'

describe 'Merchants BI API' do
  it 'returns the total revenue for a merchant across successful transactions' do
    merchant1 = create(:merchant)
    item1 = create(:item)
    invoice1 = create(:invoice, merchant_id: merchant1.id)
    invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
    transaction1 = create(:transaction, invoice_id: invoice1.id)
    transaction2 = create(:transaction, invoice_id: invoice1.id)
    id = merchant1.id

    get "/api/v1/merchants/#{id}/revenue"

    number = JSON.parse(response.body)["data"]["attributes"]["total_revenue"]

    expect(number).to eq(200)
  end
  it 'returns the total revenue for a merchant for a specific date' do
    merchant1 = create(:merchant)
    item1 = create(:item)
    invoice1 = create(:invoice, merchant_id: merchant1.id, created_at: 1.day.ago )
    invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
    transaction1 = create(:transaction, invoice_id: invoice1.id)
    invoice2 = create(:invoice, merchant_id: merchant1.id, created_at: 1.day.ago)
    invoice_item2 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
    transaction2 = create(:transaction, invoice_id: invoice1.id)
    invoice3 = create(:invoice, merchant_id: merchant1.id)
    invoice_item3 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
    transaction3 = create(:transaction, invoice_id: invoice1.id)
    id = merchant1.id
    date = 1.day.ago

    get "/api/v1/merchants/#{id}/revenue?date=#{date}"

    number = JSON.parse(response.body)["data"]["attributes"]["total_revenue"]

    expect(number).to eq(200)
  end
end
