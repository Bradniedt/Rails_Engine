require 'rails_helper'

describe 'Transactions API' do
  it 'returns a json list of transaction data' do
    create_list(:transaction, 3)

    get '/api/v1/transactions'

    transactions = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(transactions.count).to eq(3)
  end
  it 'returns data for a specific transaction' do
    transaction1 = create(:transaction)
    id = transaction1.id

    get "/api/v1/transactions/#{id}"

    transaction = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(transaction["attributes"]["id"]).to eq(transaction1.id)
  end
end
