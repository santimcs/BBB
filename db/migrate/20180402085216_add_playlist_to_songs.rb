class AddPlaylistToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :playlist, :boolean, default: false
  end
end
