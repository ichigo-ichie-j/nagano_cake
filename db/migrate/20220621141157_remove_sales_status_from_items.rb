class RemoveSalesStatusFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :SalesStatus, :boolean
  end
end
