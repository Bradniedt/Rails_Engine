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
  end
end
