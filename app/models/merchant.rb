class Merchant < ApplicationRecord
  validates_presence_of :name
  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy

  def total_revenue
    top = Merchant.select("sum(invoice_items.unit_price * invoice_items.quantity) AS total_rev").joins(invoices: [:invoice_items, :transactions]).where("merchants.id = ?", self.id).where("transactions.result = ?", "success")[0]
    top.total_rev
  end
  def date_revenue(date)
    self.invoices.joins(:invoice_items, :transactions)
        .where("transactions.result = ?", "success")
        .where("invoices.created_at = ?", date)
        .sum("invoice_items.unit_price * invoice_items.quantity")
  end
  def favorite_customer
    Customer.joins(invoices: [:transactions])
            .select("customers.*, sum(invoices.id) AS transaction_count")
            .where("transactions.result = ? AND invoices.merchant_id = ?", "success", self.id)
            .group("customers.id")
            .order("transaction_count DESC")
            .limit(1)[0]
  end
  def self.top_by_revenue(x)
    Merchant.select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue").joins(invoices: :invoice_items).joins(invoices: :transactions).where("transactions.result = ?", "success").group("merchants.id").order("revenue DESC").limit(x)
  end
end
