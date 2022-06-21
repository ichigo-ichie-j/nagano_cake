class Admin::ItemsController < ApplicationController
  def index
    
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_item_path(@item.id)
  end

  def new
    @item = Item.new(params[:id])
  end

  def edit
  end

  def show
  end

  def update
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :explanation, :non_taxed_price, :sales_status, :image)
  end
end
