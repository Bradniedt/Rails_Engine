class Invoice < ApplicationRecord
  validates_presence_of :customer_id, :merchant_id, :status
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions, dependent: :destroy
  has_many :invoice_items, dependent: :destroy 
end
