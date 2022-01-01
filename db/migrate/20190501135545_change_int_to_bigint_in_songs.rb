class ChangeIntToBigintInSongs < ActiveRecord::Migration[5.1]
  def change
  	change_column :songs, :views, :bigint
  end
end
