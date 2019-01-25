require 'rails_helper'

describe 'InvoiceItems API' do
  it 'finds and returns invoice_item data based on an id' do
    invoice_item1 = create(:invoice_item)
    invoice_item2 = create(:invoice_item)
    id = invoice_item1.id

    get "/api/v1/invoice_items/find?id=#{id}"

    invoice_item = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(invoice_item["attributes"]["id"]).to eq(id)
  end
  it 'finds and returns invoice_item data based on a item_id' do
    invoice_item1 = create(:invoice_item)
    invoice_item2 = create(:invoice_item)
    item_id = invoice_item1.item_id

    get "/api/v1/invoice_items/find?item_id=#{item_id}"

    invoice_item = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(invoice_item["attributes"]["item_id"]).to eq(item_id)
  end
  it 'finds and returns invoice_item data based on a invoice_id' do
    invoice_item1 = create(:invoice_item)
    invoice_item2 = create(:invoice_item)
    invoice_id = invoice_item1.invoice_id

    get "/api/v1/invoice_items/find?invoice_id=#{invoice_id}"

    invoice_item = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(invoice_item["attributes"]["invoice_id"]).to eq(invoice_id)
  end
  it 'finds and returns invoice_item data based on a quantity' do
    invoice_item1 = create(:invoice_item)
    invoice_item2 = create(:invoice_item)
    quantity = invoice_item1.quantity

    get "/api/v1/invoice_items/find?quantity=#{quantity}"

    invoice_item = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(invoice_item["attributes"]["quantity"]).to eq(quantity)
  end
  it 'finds and returns invoice_item data based on a unit_price' do
    invoice_item1 = create(:invoice_item)
    invoice_item2 = create(:invoice_item)
    unit_price = invoice_item1.unit_price

    get "/api/v1/invoice_items/find?unit_price=#{unit_price}"

    invoice_item = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(invoice_item["attributes"]["unit_price"]).to eq(unit_price)
  end
  it 'finds and returns invoice_item data based on created_at' do
    invoice_item1 = create(:invoice_item, created_at: "2012-03-27 14:54:09 UTC")
    invoice_item2 = create(:invoice_item)
    c_at = invoice_item1.created_at

    get "/api/v1/invoice_items/find?created_at=#{c_at}"

    invoice_item = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(invoice_item["attributes"]["id"]).to eq(invoice_item1.id)
  end
  it 'finds and returns invoice_item data based on updated_at' do
    invoice_item1 = create(:invoice_item, updated_at: "2012-03-27 14:54:09 UTC")
    invoice_item2 = create(:invoice_item)
    u_at = invoice_item1.updated_at

    get "/api/v1/invoice_items/find?updated_at=#{u_at}"

    invoice_item = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(invoice_item["attributes"]["id"]).to eq(invoice_item1.id)
  end
end
