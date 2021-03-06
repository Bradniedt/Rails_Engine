require 'rails_helper'

describe 'Items BI API' do
  it 'returns the top x items ranked by total revenue generated' do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    item1 = create(:item, merchant_id: merchant1.id)
    invoice1 = create(:invoice, merchant_id: merchant1.id)
    invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
    invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
    invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
    transaction1 = create(:transaction, invoice_id: invoice1.id)
    item2 = create(:item, merchant_id: merchant1.id)
    invoice2 = create(:invoice, merchant_id: merchant1.id)
    invoice_item2 = create(:invoice_item, item_id: item2.id, invoice_id: invoice2.id, quantity: 10, unit_price: 10)
    invoice_item3 = create(:invoice_item, item_id: item2.id, invoice_id: invoice2.id, quantity: 2, unit_price: 2)
    transaction2 = create(:transaction, invoice_id: invoice2.id)
    item3 = create(:item, merchant_id: merchant2.id)
    invoice3 = create(:invoice, merchant_id: merchant2.id)
    invoice_item4 = create(:invoice_item, item_id: item3.id, invoice_id: invoice3.id, quantity: 5, unit_price: 5)
    transaction3 = create(:transaction, invoice_id: invoice3.id)

    get "/api/v1/items/most_revenue?quantity=2"

    top_items = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(top_items[0]["id"].to_i).to eq(item1.id)
    expect(top_items[1]["id"].to_i).to eq(item2.id)
  end
  it 'returns the top x items ranked by total quantity sold' do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    item1 = create(:item, merchant_id: merchant1.id)
    invoice1 = create(:invoice, merchant_id: merchant1.id)
    invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
    invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
    invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
    transaction1 = create(:transaction, invoice_id: invoice1.id)
    item2 = create(:item, merchant_id: merchant1.id)
    invoice2 = create(:invoice, merchant_id: merchant1.id)
    invoice_item2 = create(:invoice_item, item_id: item2.id, invoice_id: invoice2.id, quantity: 10, unit_price: 10)
    invoice_item3 = create(:invoice_item, item_id: item2.id, invoice_id: invoice2.id, quantity: 2, unit_price: 2)
    transaction2 = create(:transaction, invoice_id: invoice2.id)
    item3 = create(:item, merchant_id: merchant2.id)
    invoice3 = create(:invoice, merchant_id: merchant2.id)
    invoice_item4 = create(:invoice_item, item_id: item3.id, invoice_id: invoice3.id, quantity: 5, unit_price: 5)
    transaction3 = create(:transaction, invoice_id: invoice3.id)

    get "/api/v1/items/most_items?quantity=2"

    most_items = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(most_items[0]["id"].to_i).to eq(item1.id)
    expect(most_items[1]["id"].to_i).to eq(item2.id)
  end
  it 'returns the top x items ranked by total quantity sold' do
    merchant1 = create(:merchant)
    item1 = create(:item, merchant_id: merchant1.id)
    invoice0 = create(:invoice, merchant_id: merchant1.id, created_at: "2012-03-24")
    invoice_item0 = create(:invoice_item, item_id: item1.id, invoice_id: invoice0.id, quantity: 10, unit_price: 10)
    invoice_item0 = create(:invoice_item, item_id: item1.id, invoice_id: invoice0.id, quantity: 10, unit_price: 10)
    invoice_item0 = create(:invoice_item, item_id: item1.id, invoice_id: invoice0.id, quantity: 10, unit_price: 10)
    transaction0 = create(:transaction, invoice_id: invoice0.id)
    invoice2 = create(:invoice, merchant_id: merchant1.id, created_at: "2012-03-22")
    invoice_item2 = create(:invoice_item, item_id: item1.id, invoice_id: invoice2.id, quantity: 10, unit_price: 10)
    invoice_item3 = create(:invoice_item, item_id: item1.id, invoice_id: invoice2.id, quantity: 2, unit_price: 2)
    transaction2 = create(:transaction, invoice_id: invoice2.id)
    invoice3 = create(:invoice, merchant_id: merchant1.id, created_at: "2012-03-19")
    invoice_item4 = create(:invoice_item, item_id: item1.id, invoice_id: invoice3.id, quantity: 5, unit_price: 5)
    transaction3 = create(:transaction, invoice_id: invoice3.id)
    id = item1.id

    get "/api/v1/items/#{id}/best_day"

    best_day = JSON.parse(response.body)["data"]["attributes"]["created_at"]

    expect(response).to be_successful
    expect(best_day).to eq("2012-03-24T00:00:00.000Z")
  end
end
