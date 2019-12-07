class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.bigint :stock
      t.bigint :retailPrice
      t.references :vendor, foreign_key: true

      t.timestamps
    end
  end
end
