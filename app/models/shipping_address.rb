class ShippingAddress < ApplicationRecord
  belongs_to :member

  # Addressモデル
  def full_address
    '〒' + delivery_code.to_s + ' ' + delivery_address.to_s + ' ' + address.to_s
  end

end
