class Admin::OrdersController < ApplicationController
  def show
     @order = Order.find(params[:id])
     @order_items = OrderItem.all
  end

  def update
  end
end
