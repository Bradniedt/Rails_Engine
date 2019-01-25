class Api::V1::Customers::FindController < ApplicationController
  def show
    if params[:id]
      render json: CustomerSerializer.new(Customer.find(params[:id]))
    elsif params[:first_name]
      f_name= Customer.where("LOWER(customers.first_name) = ?", params[:first_name].downcase).first
      render json: CustomerSerializer.new(f_name)
    elsif params[:last_name]
      l_name= Customer.where("LOWER(customers.last_name) = ?", params[:last_name].downcase).first
      render json: CustomerSerializer.new(l_name)
    elsif params[:created_at]
      render json: CustomerSerializer.new(Customer.find_by(created_at: params[:created_at]))
    end
  end
end
