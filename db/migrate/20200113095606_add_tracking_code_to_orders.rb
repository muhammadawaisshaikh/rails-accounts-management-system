class AddTrackingCodeToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :tracking_code, :string
  end
end
