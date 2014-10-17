class RemoveAmountFromGoals < ActiveRecord::Migration
  def change
  	 remove_column :goals, :amount
  end
end
