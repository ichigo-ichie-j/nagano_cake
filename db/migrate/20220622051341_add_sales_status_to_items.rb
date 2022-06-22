class AddSalesStatusToItems < ActiveRecord::Migration[6.1]
  def change
    change_column :items, :sales_status, :boolean, default: true, null: false
    remove_column :items, :SalesStatus
  end
end
