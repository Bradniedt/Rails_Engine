require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should have_many(:invoices) }
  end
  describe 'instance methods' do
    it '.favorite_merchant' do
      customer = create(:customer)
      merchant1 = create(:merchant, name: "one")
      merchant2 = create(:merchant, name: "two")
      merchant3 = create(:merchant, name: "three")
      invoice1 = create(:invoice, customer_id: customer.id, merchant_id: merchant1.id,)
      invoice_item1 = create(:invoice_item, invoice_id: invoice1.id, quantity: 10, unit_price: 10)
      transaction1 = create(:transaction, invoice_id: invoice1.id)
      invoice2 = create(:invoice, customer_id: customer.id, merchant_id: merchant2.id)
      invoice_item2 = create(:invoice_item, invoice_id: invoice2.id, quantity: 5, unit_price: 5)
      transaction1 = create(:transaction, invoice_id: invoice2.id)
      invoice3 = create(:invoice,customer_id: customer.id, merchant_id: merchant3.id)
      invoice_item3 = create(:invoice_item, invoice_id: invoice3.id, quantity: 2, unit_price: 5)
      transaction3 = create(:transaction, invoice_id: invoice3.id)
      invoice4 = create(:invoice,customer_id: customer.id, merchant_id: merchant3.id)
      invoice_item4 = create(:invoice_item, invoice_id: invoice4.id, quantity: 2, unit_price: 5)
      transaction4 = create(:transaction, invoice_id: invoice4.id)
      invoice5 = create(:invoice,customer_id: customer.id, merchant_id: merchant3.id)
      invoice_item5 = create(:invoice_item, invoice_id: invoice5.id, quantity: 2, unit_price: 5)
      transaction5 = create(:transaction, invoice_id: invoice5.id)

      merchant = customer.favorite_merchant
      expect(merchant["id"].to_i).to eq(merchant3.id)
    end
  end
end
