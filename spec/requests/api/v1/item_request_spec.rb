require 'rails_helper'

describe 'Items API' do
  it 'returns a json list of items data' do
    create_list(:item, 3)

    get '/api/v1/items'

    items = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(items.count).to eq(3)
  end
  it 'returns data for a specific item' do
    item1 = create(:item)
    id = item1.id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(item["attributes"]["name"]).to eq(item1.name)
  end
end
