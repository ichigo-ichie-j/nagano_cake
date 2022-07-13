class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_items

  def add_tax_non_taxed_price
  (self.non_taxed_price * 1.10).round
  end
   #imageが保存されていないために起きるエラーを回避する記述
   def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
   end

end
