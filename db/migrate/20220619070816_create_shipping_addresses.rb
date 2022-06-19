class CreateShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_addresses do |t|
      t.string :address
      t.text :delivery_address
      t.string :delivery_code
      t.integer :member_id

      t.timestamps
    end
  end
end
