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

    expect(response).to be_successful
    expect(number).to eq(200)
  end
  it 'returns the revenue for a merchant for a specific date' do
    merchant1 = create(:merchant)
    item1 = create(:item, merchant_id: merchant1.id)
    invoice1 = create(:invoice, merchant_id: merchant1.id, created_at: "2012-03-25 09:54:09 UTC" )
    invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
    invoice_item3 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 5, unit_price: 5)
    transaction1 = create(:transaction, invoice_id: invoice1.id)
    invoice2 = create(:invoice, merchant_id: merchant1.id, created_at: "2011-04-21 02:00:00 UTC" )
    invoice_item2 = create(:invoice_item, item_id: item1.id, invoice_id: invoice2.id, quantity: 10, unit_price: 10, created_at: "2011-04-21 02:00:00 UTC")
    transaction2 = create(:transaction, invoice_id: invoice2.id, created_at: "2011-04-21 02:00:00 UTC")
    id = merchant1.id
    date = "2012-03-25 09:54:09 UTC"

    get "/api/v1/merchants/#{id}/revenue?date=#{date}"

    number = JSON.parse(response.body)["data"]["attributes"]["date_revenue"]

    expect(response).to be_successful
    expect(number).to eq(125)
  end
  it 'returns the customer who has purchased the most from a specific merchant' do
    merchant1 = create(:merchant)
    customer1 = create(:customer)
    customer2 = create(:customer)
    customer3 = create(:customer)
    item1 = create(:item, merchant_id: merchant1.id)
    invoice1 = create(:invoice, customer_id: customer2.id, merchant_id: merchant1.id)
    invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
    invoice_item3 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 5, unit_price: 5)
    transaction1 = create(:transaction, invoice_id: invoice1.id)
    invoice2 = create(:invoice, customer_id: customer2.id, merchant_id: merchant1.id)
    invoice_item2 = create(:invoice_item, item_id: item1.id, invoice_id: invoice2.id, quantity: 10, unit_price: 10)
    transaction2 = create(:transaction, invoice_id: invoice2.id)
    invoice3 = create(:invoice, customer_id: customer1.id, merchant_id: merchant1.id)
    invoice_item4 = create(:invoice_item, item_id: item1.id, invoice_id: invoice2.id, quantity: 10, unit_price: 10)
    transaction3 = create(:transaction, invoice_id: invoice2.id)
    id = merchant1.id

    get "/api/v1/merchants/#{id}/favorite_customer"

    customer = JSON.parse(response.body)["data"]["attributes"]

    expect(response).to be_successful
    expect(customer["id"]).to eq(customer2.id)
  end
  it 'returns the top x merchants by total revenue' do
    merchant1 = create(:merchant, name: "one")
    merchant2 = create(:merchant, name: "two")
    merchant3 = create(:merchant)
    invoice1 = create(:invoice, merchant_id: merchant1.id)
    invoice_item1 = create(:invoice_item, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
    invoice_item3 = create(:invoice_item, invoice_id: invoice1.id, quantity: 5, unit_price: 5)
    transaction1 = create(:transaction, invoice_id: invoice1.id)
    invoice2 = create(:invoice, merchant_id: merchant2.id)
    invoice_item3 = create(:invoice_item, invoice_id: invoice2.id, quantity: 5, unit_price: 5)
    transaction1 = create(:transaction, invoice_id: invoice2.id)

    get "/api/v1/merchants/most_revenue?quantity=2"

    merchants = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(merchants.count).to eq(2)
    expect(merchants[0]["id"].to_i).to eq(merchant1.id)
    expect(merchants[1]["id"].to_i).to eq(merchant2.id)
  end
  it 'returns the top x merchants by total quantity sold' do
    merchant1 = create(:merchant, name: "one")
    merchant2 = create(:merchant, name: "two")
    merchant3 = create(:merchant)
    invoice1 = create(:invoice, merchant_id: merchant1.id)
    invoice_item1 = create(:invoice_item, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
    invoice_item3 = create(:invoice_item, invoice_id: invoice1.id, quantity: 5, unit_price: 5)
    transaction1 = create(:transaction, invoice_id: invoice1.id)
    invoice2 = create(:invoice, merchant_id: merchant2.id)
    invoice_item3 = create(:invoice_item, invoice_id: invoice2.id, quantity: 3, unit_price: 5)
    transaction1 = create(:transaction, invoice_id: invoice2.id)

    get "/api/v1/merchants/most_items?quantity=2"

    merchants = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(merchants.count).to eq(2)
    expect(merchants[0]["id"].to_i).to eq(merchant1.id)
    expect(merchants[1]["id"].to_i).to eq(merchant2.id)
  end
  it 'returns the total revenue for all merchants on a specific date' do
    merchant1 = create(:merchant, name: "one")
    merchant2 = create(:merchant, name: "two")
    merchant3 = create(:merchant, name: "three")
    invoice1 = create(:invoice, merchant_id: merchant1.id, created_at: "2012-03-25 09:54:09 UTC")
    invoice_item1 = create(:invoice_item, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
    invoice_item3 = create(:invoice_item, invoice_id: invoice1.id, quantity: 5, unit_price: 5)
    transaction1 = create(:transaction, invoice_id: invoice1.id)
    invoice2 = create(:invoice, merchant_id: merchant2.id)
    invoice_item3 = create(:invoice_item, invoice_id: invoice2.id, quantity: 5, unit_price: 5)
    transaction1 = create(:transaction, invoice_id: invoice2.id)
    invoice3 = create(:invoice, merchant_id: merchant3.id, created_at: "2012-03-25 09:54:09 UTC")
    invoice_item4 = create(:invoice_item, invoice_id: invoice3.id, quantity: 5, unit_price: 5)
    transaction3 = create(:transaction, invoice_id: invoice3.id)
    date = "2012-03-25 09:54:09 UTC"

    get "/api/v1/merchants/revenue?date=#{date}"

    number = JSON.parse(response.body)["data"]["attributes"]

    expect(response).to be_successful
    expect(number["total_revenue"]).to eq(150)
  end
end
