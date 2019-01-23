require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should have_many(:items) }
    it { should have_many(:invoices) }
  end
  describe 'instance methods' do
    it '.total_revenue' do
      merchant = create(:merchant)
      invoice1 = create(:invoice)
      invoice_item1 = create(:invoice_item, invoice_id: invoice1.id quantity: 10, unit_price: 10)
      transaction1 = create(:transaction, invoice_id: invoice1.id)
      transaction2 = create(:transaction, invoice_id: invoice1.id)

      expect(merchant.top_revenue).to eq(200)
    end
  end
end
