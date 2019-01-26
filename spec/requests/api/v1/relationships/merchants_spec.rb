require 'rails_helper'

describe 'Merchant Relationship Endpoints' do
  it 'returns a collection of items associated with a specific merchant' do
    merchant = create(:merchant)
    item1 = create(:item, merchant_id: merchant.id)
    item2 = create(:item, merchant_id: merchant.id)
    item3 = create(:item, merchant_id: merchant.id)
    id = merchant.id

    get '/api/v1/merchants/#{id}/items'

    items = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(items[0]["id"].to_i).to eq(item1.id)
    expect(items[1]["id"].to_i).to eq(item2.id)
    expect(items[2]["id"].to_i).to eq(item3.id)
  end
end
