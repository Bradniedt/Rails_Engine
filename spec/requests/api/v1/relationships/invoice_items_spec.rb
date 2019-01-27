require 'rails_helper'

describe 'Invoice Items Relationship Endpoints' do
  it 'returns the invoice associated with a specific invoice item' do
    merchant1 = create(:merchant)
    invoice1 = create(:invoice, merchant: merchant1)
    invoice_item = create(:invoice_item, invoice_id: invoice1.id)
    id = invoice_item.id

    get "/api/v1/invoice_items/#{id}/invoice"

    invoice = JSON.parse(response.body)["data"]["attributes"]

    expect(response).to be_successful
    expect(invoice["id"].to_i).to eq(invoice1.id)
  end
  it 'returns the item associated with a specific invoice item' do
    merchant1 = create(:merchant)
    invoice1 = create(:invoice, merchant: merchant1)
    item1 = create(:item)
    invoice_item = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id)

    id = invoice_item.id

    get "/api/v1/invoice_items/#{id}/item"

    item = JSON.parse(response.body)["data"]["attributes"]

    expect(response).to be_successful
    expect(item["id"].to_i).to eq(item1.id)
  end
end
