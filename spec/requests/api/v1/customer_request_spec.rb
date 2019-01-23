require 'rails_helper'

describe 'Customers API' do
  it 'returns a json list of customer data' do
    Customer.new(first_name: "Bob", last_name: "Rad")
    Customer.new(first_name: "Beau", last_name: "Rad")
    Customer.new(first_name: "Bill", last_name: "Rad")

    get '/api/v1/items'

    customers = JSON.parse()
    expect(response).to be_successful
    expect(customers.count).to eq(5)
  end
end
