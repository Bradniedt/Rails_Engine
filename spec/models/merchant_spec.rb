require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should have_many(:items) }
    it { should have_many(:invoices) }
  end
  describe 'instance methods' do
    it '.total_revenue' do
      merchant1 = create(:merchant)
      item1 = create(:item)
      invoice1 = create(:invoice, merchant_id: merchant1.id)
      invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
      transaction1 = create(:transaction, invoice_id: invoice1.id)
      transaction2 = create(:transaction, invoice_id: invoice1.id)

      expect(merchant1.total_revenue).to eq(200)
    end
    it '.date_revenue' do
      merchant1 = create(:merchant)
      item1 = create(:item, merchant_id: merchant1.id)
      invoice1 = create(:invoice, merchant_id: merchant1.id, created_at: "2012-03-25 09:54:09 UTC" )
      invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
      invoice_item3 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 5, unit_price: 5)
      transaction1 = create(:transaction, invoice_id: invoice1.id)
      invoice2 = create(:invoice, merchant_id: merchant1.id, created_at: "2011-04-21 02:00:00 UTC" )
      invoice_item2 = create(:invoice_item, item_id: item1.id, invoice_id: invoice2.id, quantity: 10, unit_price: 10, created_at: "2011-04-21 02:00:00 UTC")
      transaction2 = create(:transaction, invoice_id: invoice2.id, created_at: "2011-04-21 02:00:00 UTC")

      date = "2012-03-25 09:54:09 UTC"

      expect(merchant1.date_revenue(date)).to eq(125)
    end
    it 'favorite_customer' do
      merchant1 = create(:merchant)
      customer1 = create(:customer)
      customer2 = create(:customer)
      customer3 = create(:customer)
      item1 = create(:item, merchant_id: merchant1.id)
      invoice1 = create(:invoice, customer_id: customer2.id, merchant_id: merchant1.id)
      invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
      invoice_item3 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 5, unit_price: 5)
      transaction1 = create(:transaction, invoice_id: invoice1.id)
      invoice2 = create(:invoice, customer_id: customer2.id, merchant_id: merchant1.id)
      invoice_item2 = create(:invoice_item, item_id: item1.id, invoice_id: invoice2.id, quantity: 10, unit_price: 10)
      transaction2 = create(:transaction, invoice_id: invoice2.id)
      invoice3 = create(:invoice, customer_id: customer1.id, merchant_id: merchant1.id)
      invoice_item4 = create(:invoice_item, item_id: item1.id, invoice_id: invoice2.id, quantity: 10, unit_price: 10)
      transaction3 = create(:transaction, invoice_id: invoice2.id)

      expect(merchant1.favorite_customer).to eq(customer2)
    end
  end
  describe 'class methods' do
    it '#top_by_revenue' do
      merchant1 = create(:merchant, name: "one")
      merchant2 = create(:merchant, name: "two")
      merchant3 = create(:merchant)
      invoice1 = create(:invoice, merchant_id: merchant1.id)
      invoice_item1 = create(:invoice_item, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
      invoice_item3 = create(:invoice_item, invoice_id: invoice1.id, quantity: 5, unit_price: 5)
      transaction1 = create(:transaction, invoice_id: invoice1.id)
      invoice2 = create(:invoice, merchant_id: merchant2.id)
      invoice_item3 = create(:invoice_item, invoice_id: invoice2.id, quantity: 5, unit_price: 5)
      transaction1 = create(:transaction, invoice_id: invoice2.id)

      expect(Merchant.top_by_revenue(2)[0].id).to eq(merchant1.id)
      expect(Merchant.top_by_revenue(2)[1].id).to eq(merchant2.id)
    end
    it '#top_by_sold' do
      merchant1 = create(:merchant, name: "one")
      merchant2 = create(:merchant, name: "two")
      merchant3 = create(:merchant)
      invoice1 = create(:invoice, merchant_id: merchant1.id)
      invoice_item1 = create(:invoice_item, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
      invoice_item3 = create(:invoice_item, invoice_id: invoice1.id, quantity: 5, unit_price: 5)
      transaction1 = create(:transaction, invoice_id: invoice1.id)
      invoice2 = create(:invoice, merchant_id: merchant2.id)
      invoice_item3 = create(:invoice_item, invoice_id: invoice2.id, quantity: 3, unit_price: 5)
      transaction1 = create(:transaction, invoice_id: invoice2.id)

      merchants = Merchant.top_by_sold(2)
      expect(merchants[0]["id"].to_i).to eq(merchant1.id)
      expect(merchants[1]["id"].to_i).to eq(merchant2.id)
    end
  end
end
