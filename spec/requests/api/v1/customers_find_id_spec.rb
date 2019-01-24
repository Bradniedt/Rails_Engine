require 'rails_helper'

describe 'Customers API' do
  it 'finds and returns customer data based on an id' do
    customer1 = create(:customer)
    customer2 = create(:customer)
    id = customer1.id

    get "/api/v1/customers/find?id=#{id}"

    customer = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(customer["attributes"]["id"]).to eq(id)
  end
  it 'finds and returns customer data based on a first name' do
    customer1 = create(:customer)
    customer2 = create(:customer)
    f_name = customer1.first_name

    get "/api/v1/customers/find?first_name=#{f_name}"

    customer = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(customer["attributes"]["first_name"]).to eq(f_name)
  end
end
