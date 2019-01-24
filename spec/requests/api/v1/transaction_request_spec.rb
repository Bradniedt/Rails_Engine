require 'rails_helper'

describe 'Transactions API' do
  it 'returns a json list of transaction data' do
    create_list(:invoice_item, 3)

    get '/api/v1/transactions'

    transactions = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(transactions.count).to eq(3)
  end
end
