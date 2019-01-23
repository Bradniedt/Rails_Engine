require 'rails_helper'

describe 'Merchants API' do
  it 'returns a json list of merchant data' do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    merchants = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(merchants.count).to eq(3)
  end
  it 'returns the total revenue for a merchant across successful transactions' do
    merch1 = create(:merchant)
    merch2 = create(:merchant)
    merch3 = create(:merchant)
    item1 = create(:item, merchant_id: merch1.id, unit_price: 100)
    item2 = create(:item, merchant_id: merch2.id, unit_price: 100)
    item3 = create(:item, merchant_id: merch3.id, unit_price: 100)
    invoice1 = create(:invoice, item_id: item_1.id, quantity: 10)
    invoice2 = create(:invoice, item_id: item_2.id, quantity: 5)
    invoice3 = create(:invoice, item_id: item_3.id, quantity: 2)
    invoiceitem1 = create(:invoice_item, item_id: item1, invoice_id: invoice1,
                          quantity: 10, unit_price: 100)
    invoiceitem1 = create(:invoice_item, item_id: item1, invoice_id: invoice1,
                          quantity: 10, unit_price: 100)
    create(:transaction, invoice_id: invoice1.id, result: 'success')
    create(:transaction, invoice_id: invoice1.id, result: 'success')
    create(:transaction, invoice_id: invoice1.id, result: 'success')
    create(:transaction, invoice_id: invoice1.id, result: 'success')

  end
end
