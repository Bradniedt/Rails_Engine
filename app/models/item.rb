class Item < ApplicationRecord
  validates_presence_of :name, :description, :unit_price, :merchant_id
  belongs_to :merchant
  has_many :invoice_items, dependent: :destroy

  def self.top_by_revenue(x)
    Merchant.select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
            .joins(invoices: [:transactions, :invoice_items])
            .joins(:items)
            .where("transactions.result = ?", "success")
            .group("items.id")
            .order("revenue DESC")
            .limit(x)
  end
end
