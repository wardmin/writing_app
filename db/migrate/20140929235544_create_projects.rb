class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :project_type_id
      t.integer :project_status_id

      t.timestamps
    end
  end
end
