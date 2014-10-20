class AddProjectState < ActiveRecord::Migration
  def change
  	 add_column :projects, :aasm_state, :string
  end
end
