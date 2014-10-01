class RemoveNullFromGoals < ActiveRecord::Migration
  def change
  	remove_column :goals, :null
  end
end
