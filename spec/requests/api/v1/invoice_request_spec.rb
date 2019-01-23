require 'rails_helper'

describe 'Invoices API' do
  it 'returns a json list of invoices data' do
    customer = create(:customer)
    merchant = create(:merchant)
    create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    create(:invoice, merchant_id: merchant.id, customer_id: customer.id)

    get '/api/v1/invoices'

    invoices = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(invoices.count).to eq(3)
  end
end
