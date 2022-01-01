class AddViewsToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :views, :integer, default: 0
  end
end
