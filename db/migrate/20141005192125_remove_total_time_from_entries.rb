class RemoveTotalTimeFromEntries < ActiveRecord::Migration
  def change
  	remove_column :entries, :total_time
  end
end
