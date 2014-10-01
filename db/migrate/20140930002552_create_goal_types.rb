class CreateGoalTypes < ActiveRecord::Migration
  def change
    create_table :goal_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
