class CreateGoalStatuses < ActiveRecord::Migration
  def change
    create_table :goal_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
