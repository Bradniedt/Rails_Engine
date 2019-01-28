class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name
  has_many :invoices, dependent: :destroy

  def favorite_merchant
    Merchant.joins(invoices: [:transactions])
            .select("merchants.*, sum(invoices.id) AS transaction_count")
            .where("transactions.result = ? AND invoices.customer_id = ?", "success", self.id)
            .group("merchants.id")
            .order("transaction_count DESC")
            .limit(1)[0]
  end
  def all_transactions
    Invoice.select("transactions.*").joins(:transactions).where("invoices.customer_id = ?", self.id)
  end
end
