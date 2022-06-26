class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shipping_addresses
  has_many :order_items
  has_many :orders
  belongs_to :members

 def active_for_authentication?
    super && (user_status == true)
 end

 # 会員フルネーム
 def full_name
   self.first_name + " " + self.last_name
 end

 # 会員カナフルネーム
 def kana_full_name
   self.first_name_kana + " " + self.last_name_kana
 end

end
