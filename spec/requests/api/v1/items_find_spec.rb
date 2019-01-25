require 'rails_helper'

describe 'Items API' do
  it 'finds and returns item data based on an id' do
    item1 = create(:item)
    item2 = create(:item)
    id = item1.id

    get "/api/v1/items/find?id=#{id}"

    item = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(item["attributes"]["id"]).to eq(id)
  end
  it 'finds and returns item data based on a name' do
    item1 = create(:item)
    item2 = create(:item)
    name = item1.name

    get "/api/v1/items/find?name=#{name}"

    item = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(item["attributes"]["name"]).to eq(name)
  end
  it 'finds and returns item data based on a description' do
    item1 = create(:item)
    item2 = create(:item)
    description = item1.description
    parameter = description.parameterize

    get "/api/v1/items/find?description=#{description}"

    item = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(item["attributes"]["description"]).to eq(description)
  end
  it 'finds and returns item data based on a unit_price' do
    item1 = create(:item)
    item2 = create(:item)
    unit_price = item1.unit_price

    get "/api/v1/items/find?unit_price=#{unit_price}"

    item = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(item["attributes"]["unit_price"]).to eq(unit_price)
  end
  it 'finds and returns item data based on a merchant_id' do
    item1 = create(:item)
    item2 = create(:item)
    merchant_id = item1.merchant_id

    get "/api/v1/items/find?merchant_id=#{merchant_id}"

    item = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(item["attributes"]["merchant_id"]).to eq(merchant_id)
  end
  it 'finds and returns item data based on created_at' do
    item1 = create(:item, created_at: "2012-03-27 14:54:09 UTC")
    item2 = create(:item)
    c_at = item1.created_at

    get "/api/v1/items/find?created_at=#{c_at}"

    item = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(item["attributes"]["id"]).to eq(item1.id)
  end
  it 'finds and returns item data based on updated_at' do
    item1 = create(:item, updated_at: "2012-03-27 14:54:09 UTC")
    item2 = create(:item)
    u_at = item1.updated_at

    get "/api/v1/items/find?updated_at=#{u_at}"

    item = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(item["attributes"]["id"]).to eq(item1.id)
  end
end
