class AddSalesStatusToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :sales_status, :boolean, default: true, null: false
  end
end
