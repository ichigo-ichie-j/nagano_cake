class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :item_quantity
      t.integer :production_status
      t.integer :ordered_price

      t.timestamps
    end
  end
end
