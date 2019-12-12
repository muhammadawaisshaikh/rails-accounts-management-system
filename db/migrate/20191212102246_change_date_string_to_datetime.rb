class ChangeDateStringToDatetime < ActiveRecord::Migration[5.2]
  def change
    remove_column :payments, :date
    add_column :payments, :date, :datetime
  end
end
