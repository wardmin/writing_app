class RemoveGoalStatusFromGoals < ActiveRecord::Migration
  def change
  	remove_column :goals, :goal_status_id, :integer
  	remove_column :projects, :project_status_id, :integer
  end
end
