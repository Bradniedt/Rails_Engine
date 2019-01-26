require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:unit_price) }
    it { should validate_presence_of(:merchant_id) }
    it { should belong_to(:merchant) }
    it { should have_many(:invoice_items) }
  end
  describe 'class methods' do
    it '#top_by_revenue(num)' do
      item1 = create(:item)
      invoice1 = create(:invoice)
      invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
      invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
      invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
      transaction1 = create(:transaction, invoice_id: invoice1.id)
      item2 = create(:item)
      invoice2 = create(:invoice)
      invoice_item2 = create(:invoice_item, item_id: item2.id, invoice_id: invoice2.id, quantity: 10, unit_price: 10)
      invoice_item3 = create(:invoice_item, item_id: item2.id, invoice_id: invoice2.id, quantity: 2, unit_price: 2)
      transaction2 = create(:transaction, invoice_id: invoice2.id)
      item3 = create(:item)
      invoice3 = create(:invoice)
      invoice_item4 = create(:invoice_item, item_id: item3.id, invoice_id: invoice3.id, quantity: 5, unit_price: 5)
      transaction3 = create(:transaction, invoice_id: invoice3.id)

      top_items = Items.top_by_revenue(2)

      expect(top_items[0]["id"]).to eq(item1.id)
      expect(top_items[1]["id"]).to eq(item2.id)
    end
  end
end
