class ChangeStringDateType < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :date
    add_column :orders, :date, :datetime
  end
end
