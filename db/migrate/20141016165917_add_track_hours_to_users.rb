class AddTrackHoursToUsers < ActiveRecord::Migration
  def change
    add_column :users, :track_hours, :boolean
  end
end
