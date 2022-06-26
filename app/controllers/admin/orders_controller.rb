class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
     @order = Order.find(params[:id])
     @order_items = OrderItem.all
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_order_path(order.id)
  end
  
  def order_params
    params.require(:order).permit(:request_status)
  end
end
