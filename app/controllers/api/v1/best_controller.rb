class Api::V1::BestController < ApplicationController
  def show
    day = Item.find(params[:id]).best_day
    render json: DaySerializer.new(day)
  end
end
