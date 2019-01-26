class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    if params[:quantity]
      render json: MerchantSerializer.new(Merchant.top_by_revenue(params[:quantity]))
    else
      num = Merchant.all_revenue(params[:date])
      render json: TopRevenueSerializer.new(TotalRevenue.new(num))
    end
  end
end
