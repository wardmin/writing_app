class AddDescriptionToProjectsAgain < ActiveRecord::Migration
  def change
  	add_column :projects, :description, :string
  	add_column :projects, :deadline, :date
  end
end
