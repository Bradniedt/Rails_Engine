require 'rails_helper'

describe 'Merchants API' do
  it 'returns a json list of merchant data' do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    merchants = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(merchants.count).to eq(3)
  end
end
