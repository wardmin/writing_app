class AddMetricTargetToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :metric_target, :integer
    add_column :goals, :metric_name, :string
    add_column :goals, :amount_done, :integer
  end
end
