class Api::V1::Invoices::FindController < ApplicationController
  def show
    if params[:id]
      render json: InvoiceSerializer.new(Invoice.find(params[:id]))
    elsif params[:customer_id]
      render json: InvoiceSerializer.new(Invoice.find_by(customer_id: params[:customer_id]))
    elsif params[:merchant_id]
      render json: InvoiceSerializer.new(Invoice.find_by(merchant_id: params[:merchant_id]))
    elsif params[:status]
      status= Invoice.where("LOWER(invoices.status) = ?", params[:status].downcase).first
      render json: InvoiceSerializer.new(status)
    elsif params[:created_at]
      render json: InvoiceSerializer.new(Invoice.find_by(created_at: params[:created_at]))
    elsif params[:updated_at]
      render json: InvoiceSerializer.new(Invoice.find_by(updated_at: params[:updated_at]))
    end
  end
end
