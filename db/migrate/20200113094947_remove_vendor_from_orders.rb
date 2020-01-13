class RemoveVendorFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :vendor_id, :bigint
  end
end
