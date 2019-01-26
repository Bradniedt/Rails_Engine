class Api::V1::Items::SoldController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.top_by_sold(params[:quantity]))
  end
end
