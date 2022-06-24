class Public::HomesController < ApplicationController
  
  def top
    #アイテムを新着順で投稿表示  created_atは作成日時　descは降順   ascは昇順
    @items = Item.all.order(created_at: :desc)
  end
    
  def about
  end

end
