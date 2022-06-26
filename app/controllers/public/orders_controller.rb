class Public::OrdersController < ApplicationController
  # before_action :authenticate_member!

  def new
  end

  def confirm
  end

  def create
  end

  def complete
  end

  def index
   @orders = current_member.orders
  end

  def show
    @order = Order.find(params[:id])
   @total = @order.invoice_amount+@order.postage
  end

end
