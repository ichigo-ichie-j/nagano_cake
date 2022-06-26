class Order < ApplicationRecord

  belongs_to :member
  has_many :order_items, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_for_payment: 0, confirmation_of_payment: 1, in_production: 2, in_preparation_for_shipment: 3, already_shipped: 4}



  def add_tax_non_taxed_price
  (self.non_taxed_price * 1.10).round
  end


  ## 小計を求めるメソッド
  def subtotal
    item.add_tax_non_taxed_price * item_quantity
  end

end
