class AddChosenToArtists < ActiveRecord::Migration[5.1]
  def change
    add_column :artists, :chosen, :boolean, default: false

  end
end
