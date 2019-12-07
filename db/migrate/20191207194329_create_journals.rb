class CreateJournals < ActiveRecord::Migration[5.2]
  def change
    create_table :journals do |t|
      t.string :reference
      t.string :date
      t.string :summary
      t.bigint :amount

      t.timestamps
    end
  end
end
