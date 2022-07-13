class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  # 制作ステータス（0:着手不可  1:製作待ち  2:製作中  3:製作完了）
  enum production_status: {impossible:0, wait:1, inproduction:2, complete:3 }

end