class Api::V1::Customers::FindController < ApplicationController
  def show
    if params[:id]
      render json: CustomerSerializer.new(Customer.find(params[:id]))
    elsif params[:first_name]
      render json: CustomerSerializer.new(Customer.find_by(first_name: params[:first_name]))
    end
  end
end
