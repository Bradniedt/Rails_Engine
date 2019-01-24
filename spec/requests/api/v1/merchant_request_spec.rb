require 'rails_helper'

describe 'Merchants API' do
  it 'returns a json list of merchant data' do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    merchants = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(merchants.count).to eq(3)
  end
  it 'returns data for a specific merchant' do
    merch1 = create(:merchant)
    id = merch1.id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(merchant["attributes"]["name"]).to eq(merch1.name)
  end
  it 'returns the total revenue for a merchant across successful transactions' do
    merchant1 = create(:merchant)
    item1 = create(:item)
    invoice1 = create(:invoice, merchant_id: merchant1.id)
    invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
    transaction1 = create(:transaction, invoice_id: invoice1.id)
    transaction2 = create(:transaction, invoice_id: invoice1.id)
    id = merchant1.id

    get "/api/v1/merchants/#{id}/revenue"

    number = JSON.parse(response.body)["data"]["attributes"]["total_revenue"]

    expect(number).to eq(200)
  end
end
