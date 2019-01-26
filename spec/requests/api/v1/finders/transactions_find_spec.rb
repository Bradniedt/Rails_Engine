require 'rails_helper'

describe 'Transactions API' do
  it 'finds and returns transaction data based on an id' do
    transaction1 = create(:transaction)
    transaction2 = create(:transaction)
    id = transaction1.id

    get "/api/v1/transactions/find?id=#{id}"

    transaction = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(transaction["attributes"]["id"]).to eq(id)
  end
  it 'finds and returns transaction data based on a invoice_id' do
    transaction1 = create(:transaction)
    transaction2 = create(:transaction)
    invoice_id = transaction1.invoice_id

    get "/api/v1/transactions/find?invoice_id=#{invoice_id}"

    transaction = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(transaction["attributes"]["invoice_id"]).to eq(invoice_id)
  end
  it 'finds and returns transaction data based on a credit_card_number' do
    transaction1 = create(:transaction)
    transaction2 = create(:transaction)
    credit_card_number = transaction1.credit_card_number

    get "/api/v1/transactions/find?credit_card_number=#{credit_card_number}"

    transaction = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(transaction["attributes"]["credit_card_number"]).to eq(credit_card_number)
  end
  it 'finds and returns transaction data based on a credit_card_expiration_date' do
    transaction1 = create(:transaction)
    transaction2 = create(:transaction)
    credit_card_expiration_date = transaction1.credit_card_expiration_date

    get "/api/v1/transactions/find?credit_card_expiration_date=#{credit_card_expiration_date}"

    transaction = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(transaction["attributes"]["credit_card_expiration_date"]).to eq(credit_card_expiration_date)
  end
  it 'finds and returns transaction data based on a result' do
    transaction1 = create(:transaction)
    transaction2 = create(:transaction)
    result = transaction1.result

    get "/api/v1/transactions/find?result=#{result}"

    transaction = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(transaction["attributes"]["result"]).to eq(result)
  end
  it 'finds and returns transaction data based on created_at' do
    transaction1 = create(:transaction, created_at: "2012-03-27 14:54:09 UTC")
    transaction2 = create(:transaction)
    c_at = transaction1.created_at

    get "/api/v1/transactions/find?created_at=#{c_at}"

    transaction = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(transaction["attributes"]["id"]).to eq(transaction1.id)
  end
  it 'finds and returns transaction data based on updated_at' do
    transaction1 = create(:transaction, updated_at: "2012-03-27 14:54:09 UTC")
    transaction2 = create(:transaction)
    u_at = transaction1.updated_at

    get "/api/v1/transactions/find?updated_at=#{u_at}"

    transaction = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(transaction["attributes"]["id"]).to eq(transaction1.id)
  end
end
