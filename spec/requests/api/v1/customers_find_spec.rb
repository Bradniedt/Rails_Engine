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
  it 'finds and returns customer data based on a last name' do
    customer1 = create(:customer)
    customer2 = create(:customer)
    l_name = customer1.last_name

    get "/api/v1/customers/find?last_name=#{l_name}"

    customer = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(customer["attributes"]["last_name"]).to eq(l_name)
  end
  it 'finds and returns customer data based on created_at' do
    customer1 = create(:customer, created_at: "2012-03-27 14:54:09 UTC")
    customer2 = create(:customer)
    c_at = customer1.created_at

    get "/api/v1/customers/find?created_at=#{c_at}"

    customer = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(customer["attributes"]["id"]).to eq(customer1.id)
  end
end
