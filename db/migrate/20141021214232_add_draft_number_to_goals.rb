class AddDraftNumberToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :draft_number, :integer
  end
end
