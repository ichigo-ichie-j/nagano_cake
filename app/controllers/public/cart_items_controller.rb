class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.where(member_id: current_member.id)
    @cart_item_total_price = 0
  end

  def create
    cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
    if cart_item
      quantity = cart_item.item_quantity.to_i + params[:cart_item][:item_quantity].to_i
      # cart_item.update(quantity: quantity)
      redirect_to cart_item_params
    else
      cart_item = CartItem.new(cart_item_params)
      cart_item.save
      redirect_to cart_items_path
    end
  end

    def update
        cart_item = CartItem.find(params[:id])
        cart_item.update(cart_item_params)
        redirect_to cart_items_path
    end

    def destroy
        cart_item = CartItem.find(params[:id])
        cart_item.destroy
        redirect_to cart_items_path
    end




  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end




  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :item_quantity, :member_id)
  end
end
