class AddQuantityToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :quantity, :bigint
  end
end
