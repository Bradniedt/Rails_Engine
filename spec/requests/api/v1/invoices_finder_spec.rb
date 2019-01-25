require 'rails_helper'

describe 'Invoices API' do
  it 'finds and returns invoice data based on an id' do
    invoice1 = create(:invoice)
    invoice2 = create(:invoice)
    id = invoice1.id

    get "/api/v1/invoices/find?id=#{id}"

    invoice = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(invoice["attributes"]["id"]).to eq(id)
  end
  it 'finds and returns invoice data based on a customer_id' do
    invoice1 = create(:invoice)
    invoice2 = create(:invoice)
    customer_id = invoice1.customer_id

    get "/api/v1/invoices/find?customer_id=#{customer_id}"

    invoice = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(invoice["attributes"]["customer_id"]).to eq(customer_id)
  end
  it 'finds and returns invoice data based on a merchant_id' do
    invoice1 = create(:invoice)
    invoice2 = create(:invoice)
    merchant_id = invoice1.merchant_id

    get "/api/v1/invoices/find?merchant_id=#{merchant_id}"

    invoice = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(invoice["attributes"]["merchant_id"]).to eq(merchant_id)
  end
  it 'finds and returns invoice data based on a status' do
    invoice1 = create(:invoice)
    invoice2 = create(:invoice)
    status = invoice1.status

    get "/api/v1/invoices/find?status=#{status}"

    invoice = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(invoice["attributes"]["status"]).to eq(status)
  end
  it 'finds and returns invoice data based on created_at' do
    invoice1 = create(:invoice, created_at: "2012-03-27 14:54:09 UTC")
    invoice2 = create(:invoice)
    c_at = invoice1.created_at

    get "/api/v1/invoices/find?created_at=#{c_at}"

    invoice = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(invoice["attributes"]["id"]).to eq(invoice1.id)
  end
  it 'finds and returns invoice data based on updated_at' do
    invoice1 = create(:invoice, updated_at: "2012-03-27 14:54:09 UTC")
    invoice2 = create(:invoice)
    u_at = invoice1.updated_at

    get "/api/v1/invoices/find?updated_at=#{u_at}"

    invoice = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(invoice["attributes"]["id"]).to eq(invoice1.id)
  end
end
