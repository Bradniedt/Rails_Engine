class Api::V1::RevenueController < ApplicationController
  def show
    if params[:date]
      num = Merchant.find(params[:id]).date_revenue(params[:date])
      render json: DateRevenueSerializer.new(DateRevenue.new(num))
    elsif params[:id]
      top = Merchant.find(params[:id]).total_revenue
      render json: TopRevenueSerializer.new(TotalRevenue.new(top))
    end
  end
end
