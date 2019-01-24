require 'rails_helper'

describe 'Customers API' do
  it 'returns a json list of customer data' do
    create_list(:customer, 3)

    get '/api/v1/customers'

    customers = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(customers.count).to eq(3)
  end
  it 'returns a specific list of customer data' do
    cust1 = create(:customer)
    id = cust1.id

    get "/api/v1/customers/#{id}"

    customer = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(customer["attributes"]["first_name"]).to eq(cust1.first_name)
  end
end
