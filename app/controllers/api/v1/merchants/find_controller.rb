class Api::V1::Merchants::FindController < ApplicationController
  def show
    if params[:id]
      render json: MerchantSerializer.new(Merchant.find(params[:id]))
    elsif params[:name]
      name= Merchant.where("LOWER(merchants.first_name) = ?", params[:name].downcase).first
      render json: MerchantSerializer.new(name)
    elsif params[:created_at]
      render json: MerchantSerializer.new(Merchant.find_by(created_at: params[:created_at]))
    elsif params[:updated_at]
      render json: MerchantSerializer.new(Merchant.find_by(updated_at: params[:updated_at]))
    end
  end
end
