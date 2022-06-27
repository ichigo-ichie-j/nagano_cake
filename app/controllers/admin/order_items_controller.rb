class Admin::OrderItemsController < ApplicationController

  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @order_item.update(order_item_params)
    if @order_item.production_status == "inproduction"
      @order.update(request_status: "product")
    elsif @order.order_items.count ==  @order.order_items.where(production_status: "complete").count
      @order.update(request_status: "ready")
    end
    redirect_to admin_order_path(@order_item.order_id)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:production_status)
  end
end
