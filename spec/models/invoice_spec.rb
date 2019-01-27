require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:customer_id) }
    it { should validate_presence_of(:merchant_id) }
    it { should validate_presence_of(:status) }
    it { should belong_to(:merchant) }
    it { should belong_to(:customer) }
    it { should have_many(:transactions) }
    it { should have_many(:invoice_items) }
  end
  describe 'instance methods' do
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id)
    item1 = create(:item, merchant_id: merchant.id, )
    item2 = create(:item, merchant_id: merchant.id, )
    item3 = create(:item, merchant_id: merchant.id, )
    invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice.id)
    invoice_item2 = create(:invoice_item, item_id: item2.id, invoice_id: invoice.id)
    invoice_item3 = create(:invoice_item, item_id: item3.id, invoice_id: invoice.id)

    items = Invoice.items

    expect(items[0]["id"].to_i).to eq(item1.id)
    expect(items[1]["id"].to_i).to eq(item2.id)
    expect(items[2]["id"].to_i).to eq(item3.id)
  end
end
