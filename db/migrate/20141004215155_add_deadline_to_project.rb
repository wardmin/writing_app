class AddDeadlineToProject < ActiveRecord::Migration
  def change
  	add_column :projects, :description, :string
  	add_column :projects, :deadline, :date
  	remove_column :users, :desired_interval
  	remove_column :entries, :total_time
  end
end
