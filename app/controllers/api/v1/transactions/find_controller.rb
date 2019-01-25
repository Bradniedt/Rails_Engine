class Api::V1::Transactions::FindController < ApplicationController
  def show
    if params[:id]
      render json: TransactionSerializer.new(Transaction.find(params[:id]))
    elsif params[:invoice_id]
      render json: TransactionSerializer.new(Transaction.find_by(invoice_id: params[:invoice_id]))
    elsif params[:credit_card_number]
      render json: TransactionSerializer.new(Transaction.find_by(credit_card_number: params[:credit_card_number]))
    elsif params[:credit_card_expiration_date]
      render json: TransactionSerializer.new(Transaction.find_by(credit_card_expiration_date: params[:credit_card_expiration_date]))
    elsif params[:result]
      result= Transaction.where("LOWER(transactions.result) = ?", params[:result].downcase).first
      render json: TransactionSerializer.new(result)
    elsif params[:created_at]
      render json: TransactionSerializer.new(Transaction.find_by(created_at: params[:created_at]))
    elsif params[:updated_at]
      render json: TransactionSerializer.new(Transaction.find_by(updated_at: params[:updated_at]))
    end
  end
end
