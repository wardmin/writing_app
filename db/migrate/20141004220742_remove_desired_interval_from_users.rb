class RemoveDesiredIntervalFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :desired_interval
  	remove_column :entries, :total_time
  end
end
