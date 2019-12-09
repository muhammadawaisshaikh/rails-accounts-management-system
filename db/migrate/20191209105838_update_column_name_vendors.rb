class UpdateColumnNameVendors < ActiveRecord::Migration[5.2]
  def change
    rename_column :vendors, :name, :vendor_name
  end
end
