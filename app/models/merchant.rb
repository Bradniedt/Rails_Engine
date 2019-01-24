class Merchant < ApplicationRecord
  validates_presence_of :name
  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy

  def total_revenue
    top = Merchant.select("sum(invoice_items.unit_price * invoice_items.quantity) AS total_rev").joins(invoices: [:invoice_items, :transactions]).where("merchants.id = ?", self.id)[0]
    top.total_rev
  end
end
