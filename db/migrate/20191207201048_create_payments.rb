class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :date
      t.string :type
      t.string :toFrom
      t.bigint :amount
      t.string :status

      t.timestamps
    end
  end
end
