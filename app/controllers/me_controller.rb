class MeController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: current_user
  end

  def add
    render json: { message: "Add money to your wallet" }
  end

  def update
    amount = params[:amount].to_f
    if amount > 0
      current_user.update!(balance: current_user.balance + amount)
      render json: { success: true, message: 'Balance updated successfully', balance: current_user.balance }
    else
      render json: { success: false, message: 'Invalid amount' }
    end
  end

  def transactions
    transactions = current_user.transactions
    render json: transactions
  end
end
