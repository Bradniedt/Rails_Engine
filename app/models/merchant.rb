class Merchant < ApplicationRecord
  validates_presence_of :name
  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy

  def top_revenue
    top = Merchant.joins(invoices: :invoice_items).select("merchants.*, sum(invoice_items.unit_price) * sum(invoice_items.quantity) AS total_rev").where("merchants.id = ?", self.id).group("merchants.id")
    binding.pry
    top.total_rev
    # sql = 'SELECT sum(invoice_items.unit_price) * sum(invoice_items.quantity) AS total_rev FROM "merchants" INNER JOIN "invoices" ON "invoices"."merchant_id" = "merchants"."id" INNER JOIN "invoice_items" ON "invoice_items"."invoice_id" = "invoices"."id" WHERE (merchants.id = 8) GROUP BY merchants.id'
    # final = ActiveRecord::Base.connection.execute(sql)
  end
end
