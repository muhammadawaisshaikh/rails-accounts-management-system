class AddProfitToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :profit, :bigint
  end
end
