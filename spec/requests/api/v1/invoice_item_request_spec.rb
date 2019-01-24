require 'rails_helper'

describe 'InvoiceItems API' do
  it 'returns a json list of invoice items data' do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items'

    invoice_items = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(invoice_items.count).to eq(3)
  end
  it 'returns data for a specific invoice_item' do
    invoice_item1 = create(:invoice_item)
    id = invoice_item1.id

    get "/api/v1/invoice_items/#{id}"

    invoice_item = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(invoice_item["attributes"]["id"]).to eq(invoice_item1.id)
  end
end
