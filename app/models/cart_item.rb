class CartItem < ApplicationRecord
  belongs_to :member
  belongs_to :item
  
  ## 小計を求めるメソッド
def subtotal
    item.add_tax_non_taxed_price * item_quantity
end

end
