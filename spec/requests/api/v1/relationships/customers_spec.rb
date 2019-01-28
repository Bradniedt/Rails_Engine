require 'rails_helper'

describe 'Customer Relationship Endpoints' do
  it 'returns a collection of invoices associated with a specific customer' do
    customer1 = create(:customer)
    invoice1 = create(:invoice, customer_id: customer1.id)
    invoice2 = create(:invoice, customer_id: customer1.id)
    id = customer1.id

    get "/api/v1/customers/#{id}/invoices"

    invoices = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(invoices[0]["id"].to_i).to eq(invoice1.id)
    expect(invoices[1]["id"].to_i).to eq(invoice2.id)
  end
end
