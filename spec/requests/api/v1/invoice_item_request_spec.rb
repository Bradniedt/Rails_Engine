require 'rails_helper'

describe 'InvoiceItems API' do
  it 'returns a json list of invoice items data' do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items'

    invoice_items = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(invoice_items.count).to eq(3)
  end
end
