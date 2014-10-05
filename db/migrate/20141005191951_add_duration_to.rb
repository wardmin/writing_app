class AddDurationTo < ActiveRecord::Migration
  def change
  	add_column :entries, :duration, :integer
  end
end
