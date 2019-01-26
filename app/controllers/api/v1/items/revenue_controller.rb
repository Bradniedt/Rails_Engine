class Api::V1::Items::RevenueController < ApplicationController
  def index
    params[:quantity]
    render json: ItemSerializer.new(Item.top_by_revenue(params[:quantity]))
  end
end
