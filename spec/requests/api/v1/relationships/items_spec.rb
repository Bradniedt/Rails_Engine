require 'rails_helper'

describe 'Item Relationship Endpoints' do
  it 'returns the invoice items associated with a specific item' do
    item = create(:item)
    invoice_item1 = create(:invoice_item, item_id: item.id)
    invoice_item2 = create(:invoice_item, item_id: item.id)
    id = item.id

    get "/api/v1/items/#{id}/invoice_items"

    invoice_items = JSON.parse(response.body)["data"]["attributes"]

    expect(response).to be_successful
    expect(invoice_items[0]["id"].to_i).to eq(invoice_item1.id)
    expect(invoice_items[1]["id"].to_i).to eq(invoice_item2.id)
  end
