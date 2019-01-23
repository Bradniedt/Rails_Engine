require 'rails_helper'

describe 'Merchants API' do
  it 'returns a json list of merchant data' do
    one = Merchant.create(name: "Merch1")
    two = Merchant.create(name: "Merch2")
    three = Merchant.create(name: "Merch3")

    get '/api/v1/merchants'

    merchants = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(merchants.count).to eq(3)
  end
end
