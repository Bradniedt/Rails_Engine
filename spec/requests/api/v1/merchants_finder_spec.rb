require 'rails_helper'

describe 'Merchants API' do
  it 'finds and returns merchant data based on an id' do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    id = merchant1.id

    get "/api/v1/merchants/find?id=#{id}"

    merchant = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(merchant["attributes"]["id"]).to eq(id)
  end
  it 'finds and returns merchant data based on created_at' do
    merchant1 = create(:merchant, created_at: "2012-03-27 14:54:09 UTC")
    merchant2 = create(:merchant)
    c_at = merchant1.created_at

    get "/api/v1/merchants/find?created_at=#{c_at}"

    merchant = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(merchant["attributes"]["id"]).to eq(merchant1.id)
  end
  it 'finds and returns merchant data based on updated_at' do
    merchant1 = create(:merchant, updated_at: "2012-03-27 14:54:09 UTC")
    merchant2 = create(:merchant)
    u_at = merchant1.updated_at

    get "/api/v1/merchants/find?updated_at=#{u_at}"

    merchant = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(merchant["attributes"]["id"]).to eq(merchant1.id)
  end
end
