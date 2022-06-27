class Admin::OrdersController < ApplicationController

  def show
     @order = Order.find(params[:id])
     @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    order_items = @order.order_items
    @order.update(order_params)
    if @order.request_status == "confirm"
      order_items.update_all(production_status: "wait")
    end
    redirect_to admin_order_path(@order.id)
  end

private

  def order_params
    params.require(:order).permit(:request_status)
  end
end
