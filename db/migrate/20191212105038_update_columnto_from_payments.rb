class UpdateColumntoFromPayments < ActiveRecord::Migration[5.2]
  def change
    rename_column :payments, :toFrom, :to_from
  end
end
