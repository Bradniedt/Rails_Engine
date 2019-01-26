class Api::V1::FavoriteController < ApplicationController
  def show
    fave = Merchant.find(params[:id]).favorite_customer
    render json: FavoriteSerializer.new(fave)
  end
end
