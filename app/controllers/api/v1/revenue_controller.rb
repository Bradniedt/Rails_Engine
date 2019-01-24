class Api::V1::RevenueController < ApplicationController
  def index
    top = Merchant.find(params[:id]).total_revenue
    render json: RevenueSerializer.new(TotalRevenue.new(top))
  end
end
