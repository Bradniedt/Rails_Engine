class Api::V1::Items::FindController < ApplicationController
  def show
    if params[:id]
      render json: ItemSerializer.new(Item.find(params[:id]))
    elsif params[:name]
      name= Item.where("LOWER(items.name) = ?", params[:name].downcase).first
      render json: ItemSerializer.new(name)
    elsif params[:description]
      parameter = params[:description].tr("-", " ")
      description= Item.where("LOWER(items.description) = ?", parameter.downcase).first
      render json: ItemSerializer.new(description)
    elsif params[:unit_price]
      render json: ItemSerializer.new(Item.find_by(unit_price: params[:unit_price]))
    elsif params[:merchant_id]
      render json: ItemSerializer.new(Item.find_by(merchant_id: params[:merchant_id]))
    elsif params[:created_at]
      render json: ItemSerializer.new(Item.find_by(created_at: params[:created_at]))
    elsif params[:updated_at]
      render json: ItemSerializer.new(Item.find_by(updated_at: params[:updated_at]))
    end
  end
end
