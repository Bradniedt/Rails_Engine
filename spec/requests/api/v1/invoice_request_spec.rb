require 'rails_helper'

describe 'Invoices API' do
  it 'returns a json list of invoices data' do
    customer = create(:customer)
    merchant = create(:merchant)
    Invoice.create(merchant_id: merchant.id, customer_id: customer.id, status: 'shipped')
    Invoice.create(merchant_id: merchant.id, customer_id: customer.id, status: 'shipped')
    Invoice.create(merchant_id: merchant.id, customer_id: customer.id, status: 'shipped')

    get '/api/v1/invoices'

    invoices = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(invoices.count).to eq(3)
  end
  it 'returns data for a specific invoice' do
    invoice1 = create(:invoice)
    id = invoice1.id

    get "/api/v1/invoices/#{id}"

    invoice = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(invoice["attributes"]["status"]).to eq(invoice1.status)
  end
end
