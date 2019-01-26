require 'rails_helper'

describe 'Items BI API' do
  it 'returns the top x items ranked by total revenue generated' do
    item1 = create(:item)
    invoice1 = create(:invoice)
    invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
    invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
    invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
    transaction1 = create(:transaction, invoice_id: invoice1.id)
    item2 = create(:item)
    invoice2 = create(:invoice)
    invoice_item2 = create(:invoice_item, item_id: item2.id, invoice_id: invoice2.id, quantity: 10, unit_price: 10)
    invoice_item3 = create(:invoice_item, item_id: item2.id, invoice_id: invoice2.id, quantity: 2, unit_price: 2)
    transaction2 = create(:transaction, invoice_id: invoice2.id)
    item3 = create(:item)
    invoice3 = create(:invoice)
    invoice_item4 = create(:invoice_item, item_id: item3.id, invoice_id: invoice3.id, quantity: 5, unit_price: 5)
    transaction3 = create(:transaction, invoice_id: invoice3.id)

    get "/api/v1/items/most_revenue?quantity=2"

    top_items = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(top_items[0]["id"]).to eq(item1.id)
    expect(top_items[1]["id"]).to eq(item2.id)
  end
end 
