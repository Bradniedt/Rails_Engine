require 'rails_helper'

describe 'Invoice Items Relationship Endpoints' do
  it 'returns the invoice associated with a specific invoice item' do
    merchant1 = create(:merchant)
    invoice = create(:invoice, merchant: merchant1)
    invoice_item = create(:invoice_item, invoice_id: invoice.id)
    id = invoice_item.id

    get "/api/v1/invoice_items/#{id}/invoice"

    invoice = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(invoice["id"].to_i).to eq(invoice.id)
  end
end
