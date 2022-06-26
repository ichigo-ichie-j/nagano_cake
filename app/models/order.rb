class Order < ApplicationRecord
  belongs_to :member
  has_many :order_items, dependent: :destroy
  
   #0:クレジットカード、1:銀行振込
  enum payment_method: { credit_card: 0, transfer: 1 }
   #0:入金待ち、1:入金確認、2:製作中、3:発送準備中、4:発送済み
  enum request_status: { wait: 0, confirm: 1, product: 2, ready: 3, sent: 4 }

  def add_tax_non_taxed_price
  (self.non_taxed_price * 1.10).round
  end

  ## 小計を求めるメソッド
  def subtotal
    item.add_tax_non_taxed_price * item_quantity
  end
end