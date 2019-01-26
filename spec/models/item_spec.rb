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
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      item1 = create(:item, merchant_id: merchant1.id)
      invoice1 = create(:invoice, merchant_id: merchant1.id)
      invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
      invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
      invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
      transaction1 = create(:transaction, invoice_id: invoice1.id)
      item2 = create(:item, merchant_id: merchant1.id)
      invoice2 = create(:invoice, merchant_id: merchant1.id)
      invoice_item2 = create(:invoice_item, item_id: item2.id, invoice_id: invoice2.id, quantity: 10, unit_price: 10)
      invoice_item3 = create(:invoice_item, item_id: item2.id, invoice_id: invoice2.id, quantity: 2, unit_price: 2)
      transaction2 = create(:transaction, invoice_id: invoice2.id)
      item3 = create(:item, merchant_id: merchant2.id)
      invoice3 = create(:invoice, merchant_id: merchant2.id)
      invoice_item4 = create(:invoice_item, item_id: item3.id, invoice_id: invoice3.id, quantity: 5, unit_price: 5)
      transaction3 = create(:transaction, invoice_id: invoice3.id)

      top_items = Item.top_by_revenue(2)

      expect(top_items[0]["id"]).to eq(item1.id)
      expect(top_items[1]["id"]).to eq(item2.id)
    end
    it '#top_by_sold' do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      item1 = create(:item, merchant_id: merchant1.id)
      invoice1 = create(:invoice, merchant_id: merchant1.id)
      invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
      invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
      invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
      transaction1 = create(:transaction, invoice_id: invoice1.id)
      item2 = create(:item, merchant_id: merchant1.id)
      invoice2 = create(:invoice, merchant_id: merchant1.id)
      invoice_item2 = create(:invoice_item, item_id: item2.id, invoice_id: invoice2.id, quantity: 10, unit_price: 10)
      invoice_item3 = create(:invoice_item, item_id: item2.id, invoice_id: invoice2.id, quantity: 2, unit_price: 2)
      transaction2 = create(:transaction, invoice_id: invoice2.id)
      item3 = create(:item, merchant_id: merchant2.id)
      invoice3 = create(:invoice, merchant_id: merchant2.id)
      invoice_item4 = create(:invoice_item, item_id: item3.id, invoice_id: invoice3.id, quantity: 5, unit_price: 5)
      transaction3 = create(:transaction, invoice_id: invoice3.id)

      most_items = Item.top_by_sold(2)

      expect(most_items[0]["id"].to_i).to eq(item1.id)
      expect(most_items[1]["id"].to_i).to eq(item2.id)
    end
  end
  describe 'instance methods' do
    it '.best_day' do
      merchant1 = create(:merchant)
      item1 = create(:item, merchant_id: merchant1.id)
      invoice1 = create(:invoice, merchant_id: merchant1.id, created_at: "2012-03-25 09:54:09 UTC")
      invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
      invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
      invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
      transaction1 = create(:transaction, invoice_id: invoice1.id)
      invoice2 = create(:invoice, merchant_id: merchant1.id, created_at: "2012-03-24 04:54:09 UTC")
      invoice_item2 = create(:invoice_item, item_id: item1.id, invoice_id: invoice2.id, quantity: 10, unit_price: 10)
      invoice_item3 = create(:invoice_item, item_id: item1.id, invoice_id: invoice2.id, quantity: 2, unit_price: 2)
      transaction2 = create(:transaction, invoice_id: invoice2.id)
      invoice3 = create(:invoice, merchant_id: merchant1.id, created_at: "2012-03-23 09:54:09 UTC")
      invoice_item4 = create(:invoice_item, item_id: item1.id, invoice_id: invoice3.id, quantity: 5, unit_price: 5)
      transaction3 = create(:transaction, invoice_id: invoice3.id)

      best_day = item1.best_day["created_at"]

      expect(best_day).to eq("Sun, 25 Mar 2012 09:54:09 UTC +00:00")
    end
  end
end
