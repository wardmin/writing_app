class CreateProjectStatuses < ActiveRecord::Migration
  def change
    create_table :project_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
