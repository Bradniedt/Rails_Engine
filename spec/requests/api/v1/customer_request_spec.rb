require 'rails_helper'

describe 'Customers API' do
  it 'returns a json list of customer data' do
    one = Customer.create(first_name: "Bob", last_name: "Rad")
    two = Customer.create(first_name: "Beau", last_name: "Rad")
    three = Customer.create(first_name: "Bill", last_name: "Rad")

    get '/api/v1/customers'

    customers = JSON.parse(response.body)
    expect(response).to be_successful
    expect(customers.count).to eq(1)
  end
end
