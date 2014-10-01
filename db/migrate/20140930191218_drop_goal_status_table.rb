class DropGoalStatusTable < ActiveRecord::Migration
  def change
  	drop_table :goal_statuses
  	drop_table :project_statuses
  end
end
