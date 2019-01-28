require 'rails_helper'

describe 'Transaction Relationship Endpoints' do
  it 'returns the invoice associated with a specific transaction' do
    invoice1 = create(:invoice)
    transaction = create(:transaction, invoice_id: invoice1.id)
    id = transaction.id

    get "/api/v1/transactions/#{id}/invoice"

    invoice = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(invoice[0]["id"].to_i).to eq(invoice1.id)
  end
end
