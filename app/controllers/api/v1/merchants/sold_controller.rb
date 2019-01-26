class Api::V1::Merchants::SoldController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.top_by_sold(params[:quantity]))
  end
end
