class RemoveIntentionFromEntries < ActiveRecord::Migration
  def change
  	remove_column :entries, :intention
  	remove_column :entries, :name
  end
end
