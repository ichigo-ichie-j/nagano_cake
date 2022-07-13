class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @orders = Order.all.page(params[:page]).per(10)
    @order_items = OrderItem.all
  end

end
