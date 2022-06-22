class Public::ItemsController < ApplicationController
  
  def index
    @quantity = Item.count
    @items = Item.all
    
  end
  
  def show
  end
  
end
