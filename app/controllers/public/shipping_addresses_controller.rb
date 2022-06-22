class Public::ShippingAddressesController < ApplicationController
  def index
    @shipping_addresses = current_member.shipping_addresses
    @shipping_address = ShippingAddress.new
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.member_id = current_member.id
    if @shipping_address.save
      redirect_to shipping_addresses_path
    else
    @shipping_addresses = current_member.shipping_addresses
    render 'index'
    end
  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.destroy
     redirect_to  shipping_addresses_path

  end

  def edit
     @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
     redirect_to  shipping_addresses_path
    else
      render 'edit'
    end
  end

  private
  def shipping_address_params
    params.require(:shipping_address).permit(:address, :delivery_address, :delivery_code)

  end
end
