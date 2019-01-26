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
  def self.top_by_sold(x)
    Merchant.select("items.*, sum(invoice_items.quantity) AS total_sold")
            .joins(invoices: [:transactions, :invoice_items])
            .joins(:items)
            .where("transactions.result = ?", "success")
            .group("items.id")
            .order("total_sold DESC")
            .limit(x)
  end
  def best_day
    Merchant.select("invoices.created_at, sum(invoice_items.quantity) AS total_sold")
            .joins(invoices: [:transactions, :invoice_items])
            .joins(:items)
            .where("invoice_items.item_id= ?", self.id)
            .group("invoices.id")
            .order("total_sold DESC, invoices.created_at ASC")
            .limit(1)[0]
  end
end
