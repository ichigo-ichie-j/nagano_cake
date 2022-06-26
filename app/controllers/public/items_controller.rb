class Public::ItemsController < ApplicationController

  def index
     @genres = Genre.all
     if params[:genre_id]
      # @genre = Genre.where(name: params[:genre_name])
      @items = Item.where(genre_id: params[:genre_id]).page(params[:page]).per(8)
     else
      @items = Item.all.page(params[:page]).per(8)
     end
    # @item = Item.find(params[:id])
  end

  def show
    @items = Item.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end


end
