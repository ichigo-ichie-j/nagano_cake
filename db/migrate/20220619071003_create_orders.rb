class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.integer :postage
      t.integer :invoice_amount
      t.integer :payment_method
      t.string :address
      t.text :delivery_address
      t.string :delivery_code
      t.integer :request_status

      t.timestamps
    end
  end
end
