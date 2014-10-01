class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.string :intention
      t.float :total_time
      t.text :journal
      t.integer :amount_done
      t.datetime :time_started

      t.timestamps
    end
  end
end
