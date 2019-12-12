class UpdateColumnPayments < ActiveRecord::Migration[5.2]
  def change
    rename_column :payments, :type, :purpose
  end
end
