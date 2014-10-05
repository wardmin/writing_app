class AddDesiredIntervalToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :desired_interval, :integer
  	add_column :entries, :total_time, :integer
  end
end
