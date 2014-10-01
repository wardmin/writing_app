class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name
      t.integer :goal_type_id
      t.integer :amount, :null
      t.date :deadline, :null
      t.integer :metric_id, :null
      t.integer :goal_status_id

      t.timestamps
    end
  end
end
