class UpdateColumnOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :description, :address
  end
end
