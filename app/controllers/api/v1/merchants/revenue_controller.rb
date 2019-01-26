class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.top_by_revenue(params[:quantity]))
  end
end
