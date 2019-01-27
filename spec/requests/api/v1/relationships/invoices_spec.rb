require 'rails_helper'

describe 'Invoice Relationship Endpoints' do
  it 'returns a collection of transactions associated with a specific invoice' do
    invoice = create(:invoice)
    transaction1 = create(:transaction, invoice_id: invoice.id)
    transaction2 = create(:transaction, invoice_id: invoice.id)
    transaction3 = create(:transaction, invoice_id: invoice.id)
    id = invoice.id

    get "/api/v1/invoices/#{id}/transactions"

    transactions = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(transactions[0]["id"].to_i).to eq(transaction1.id)
    expect(transactions[1]["id"].to_i).to eq(transaction2.id)
    expect(transactions[2]["id"].to_i).to eq(transaction3.id)
  end
  it 'returns a collection of invoice_items associated with a specific invoice' do
    invoice = create(:invoice)
    invoice_item1 = create(:invoice_item, invoice_id: invoice.id)
    invoice_item2 = create(:invoice_item, invoice_id: invoice.id)
    invoice_item3 = create(:invoice_item, invoice_id: invoice.id)
    id = invoice.id

    get "/api/v1/invoices/#{id}/invoice_items"

    invoice_items = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(invoice_items[0]["id"].to_i).to eq(invoice_item1.id)
    expect(invoice_items[1]["id"].to_i).to eq(invoice_item2.id)
    expect(invoice_items[2]["id"].to_i).to eq(invoice_item3.id)
  end
  it 'returns a collection of items associated with a specific invoice' do
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id)
    item1 = create(:item, merchant_id: merchant.id, )
    item2 = create(:item, merchant_id: merchant.id, )
    item3 = create(:item, merchant_id: merchant.id, )
    invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice.id)
    invoice_item2 = create(:invoice_item, item_id: item2.id, invoice_id: invoice.id)
    invoice_item3 = create(:invoice_item, item_id: item3.id, invoice_id: invoice.id)
    id = invoice.id

    get "/api/v1/invoices/#{id}/items"

    items = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(items[0]["id"].to_i).to eq(item1.id)
    expect(items[1]["id"].to_i).to eq(item2.id)
    expect(items[2]["id"].to_i).to eq(item3.id)
  end
  it 'returns the customer associated with a specific invoice' do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    id = invoice.id

    get "/api/v1/invoices/#{id}/customer"

    customer = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(customer[0]["id"].to_i).to eq(customer.id)
  end
end
