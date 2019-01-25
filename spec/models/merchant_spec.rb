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
      item1 = create(:item)
      invoice1 = create(:invoice, merchant_id: merchant1.id, created_at: 1.day.ago )
      invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
      transaction1 = create(:transaction, invoice_id: invoice1.id)
      invoice2 = create(:invoice, merchant_id: merchant1.id, created_at: 1.day.ago)
      invoice_item2 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
      transaction2 = create(:transaction, invoice_id: invoice1.id)
      invoice3 = create(:invoice, merchant_id: merchant1.id)
      invoice_item3 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
      transaction3 = create(:transaction, invoice_id: invoice1.id)
      date = 1.day.ago

      expect(merchant1.date_revenue(date)).to eq(200)
    end
  end
end
