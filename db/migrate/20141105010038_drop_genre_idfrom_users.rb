class DropGenreIdfromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :genre_id
  end
end
