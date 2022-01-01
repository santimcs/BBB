class AddRs500ToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :rs500, :integer, default: 999
  end
end
