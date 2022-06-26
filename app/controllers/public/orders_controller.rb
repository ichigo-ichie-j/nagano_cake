class Public::OrdersController < ApplicationController
  # before_action :authenticate_member!

  def new
    @order = Order.new
    @addresses = current_member.shipping_addresses
    @member = Member.find(current_member.id)
    @shipping_addresses = @member.shipping_addresses.all
  end

  def index
   @orders = current_member.orders
  end

  def show
   @order = Order.find(params[:id])
   @total = @order.invoice_amount+@order.postage

  def confirm
    @cart_items = CartItem.all
    @order = Order.new(order_params)
      #address_number と定義した1～3の番号でif文を作成
      if params[:order][:address_number] == "1"
        # ここにはカレントカスタマーの住所が飛んできます
          @order.delivery_address = current_member.address
          @order.delivery_code = current_member.zip_code
          @order.address = current_member.first_name + current_member.last_name
      elsif params[:order][:address_number] == "2"
        # ここには選択した住所のIDが飛んできます
          @shipping_address = ShippingAddress.find(params[:order][:address_id].to_i)
          @order.delivery_address = @shipping_address.delivery_address
          @order.delivery_code = @shipping_address.delivery_code
          @order.address = @shipping_address.address
      else
        # フォームで入力した住所が飛んできます
        # １フォームから入力したデータをパラムスでどう受け取るかを確認する
        # ２＠オーダーのデーターにフォームのデーターを代入する
        @order.delivery_address = params[:order][:delivery_address]
        @order.delivery_code = params[:order][:delivery_code]
        @order.address = params[:order][:address]
        # ここで新規アドレスを保存
        @new_address = ShippingAddress.new
        @new_address.delivery_address = params[:order][:delivery_address]
        @new_address.delivery_code = params[:order][:delivery_code]
        @new_address.address = params[:order][:address]
        @new_address.member_id = current_member.id
        @new_address.save
      end
        # 金額表示
        @cart_item_total_price = 0
  end

  def complete
  end

  # 購入を確定します
  def create # Order に情報を保存します
    @cart_items = CartItem.all
    # ログインユーザーのカートアイテムをすべて取り出して order_items に入れます
      @order = Order.new(order_params)
    # 渡ってきた値を @order に入れます
      if @order.save
    # ここに至るまでの間にチェックは済ませていますが、念の為IF文で分岐させています
        @cart_items.each do |cart|
        # 取り出したカートアイテムの数繰り返します
        #order_detail にも一緒にデータを保存する必要があるのでここで保存します
          order_item = OrderItem.new
          order_item.item_id = cart.item_id
          order_item.order_id = @order.id
          order_item.item_quantity = cart.item_quantity
        # 購入が完了したらカート情報は削除するのでこちらに保存します
          order_item.ordered_price = cart.item.non_taxed_price
        # カート情報を削除するので item との紐付けが切れる前に保存します
          order_item.save
        end
        # ユーザーに関連するカートのデータ(購入したデータ)が保存されているので
        # complete画面に行ったらカート商品が削除される
          @cart_items.destroy_all
          redirect_to complete_orders_path
      else
        @order = Order.new(order_params)
        render :new
      end
  end

  private
  def order_params
    params.require(:order).permit(:payment_method,:member_id,:delivery_code,:address,:delivery_address,:item_id,:invoice_amount,:postage,:request_status)
  end

end
