class AddProcessedToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :processed, :boolean, default: false
  end
end
