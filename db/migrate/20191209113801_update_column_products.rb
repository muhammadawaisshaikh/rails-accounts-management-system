class UpdateColumnProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :name, :product_name
  end
end
