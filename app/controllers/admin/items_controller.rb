class Admin::ItemsController < ApplicationController
  def index
    @item = Item.new(params[:id])
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def new
    @item = Item.new(params[:id])
  end

  def edit
     @item = Item.find(params[:id])
  end

  def show
     @item = Item.find(params[:id])
  end

  def update
    @item = Item.new(item_params)
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :non_taxed_price, :sales_status, :image)
  end
end
