class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :mobile
      t.bigint :amount
      t.string :description
      t.string :date
      t.string :status
      t.string :paymentStatus
      t.references :product, foreign_key: true
      t.references :vendor, foreign_key: true

      t.timestamps
    end
  end
end
