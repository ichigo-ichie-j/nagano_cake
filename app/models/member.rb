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
end
