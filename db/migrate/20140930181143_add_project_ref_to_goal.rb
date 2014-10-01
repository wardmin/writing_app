class AddProjectRefToGoal < ActiveRecord::Migration
  def change
  	add_reference :goals, :project, index: true
  end
end
