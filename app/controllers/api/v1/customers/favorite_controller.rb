class Api::V1::Customers::FavoriteController < ApplicationController
  def show
    fave = Customer.find(params[:id]).favorite_merchant
    render json: MerchantSerializer.new(fave)
  end
end
