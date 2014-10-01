class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :location
      t.integer :genre_id
      t.integer :desired_amount
      t.string :desired_interval

      t.timestamps
    end
  end
end
