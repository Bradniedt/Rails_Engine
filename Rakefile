# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require 'csv'

Rails.application.load_tasks

namespace :import do
  desc 'Imports the customer information'
  task :customers => :environment do
    Customer.destroy_all
    puts 'Importing customer CSV data...'
    CSV.foreach("./db/data/customers.csv", :headers => true) do |row|
      Customer.create!(row.to_hash)
    end
    puts 'Complete!'
  end
  desc 'Imports the merchant information'
  task :merchants => :environment do
    Merchant.destroy_all
    puts 'Importing merchant CSV data...'
    CSV.foreach("./db/data/merchants.csv", :headers => true) do |row|
      Merchant.create!(row.to_hash)
    end
    puts 'Complete!'
  end
  desc 'Imports the invoice information'
  task :invoices => :environment do
    Invoice.destroy_all
    puts 'Importing invoice CSV data...'
    CSV.foreach("./db/data/invoices.csv", :headers => true) do |row|
      Invoice.create!(row.to_hash)
    end
    puts 'Complete!'
  end
  desc 'Imports the item information'
  task :items => :environment do
    Item.destroy_all
    puts 'Importing item CSV data...'
    CSV.foreach("./db/data/items.csv", :headers => true) do |row|
      Item.create!(row.to_hash)
    end
    puts 'Complete!'
  end
  desc 'Imports the invoice item information'
  task :invoice_items => :environment do
    InvoiceItem.destroy_all
    puts 'Importing invoice item CSV data...'
    CSV.foreach("./db/data/invoice_items.csv", :headers => true) do |row|
      InvoiceItem.create!(row.to_hash)
    end
    puts 'Complete!'
  end
  desc 'Imports the transaction information'
  task :transactions => :environment do
    Transaction.destroy_all
    puts 'Importing transaction item CSV data...'
    CSV.foreach("./db/data/transactions.csv", :headers => true) do |row|
      Transaction.create!(row.to_hash)
    end
    puts 'Complete!'
  end
end
