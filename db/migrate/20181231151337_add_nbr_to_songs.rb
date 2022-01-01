class AddNbrToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :nbr, :integer, default: 99
  end
end
