require 'rails_helper'

describe 'Items API' do
  it 'returns a json list of items data' do
    create_list(:item, 3)

    get '/api/v1/items'

    items = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(items.count).to eq(3)
  end
end
