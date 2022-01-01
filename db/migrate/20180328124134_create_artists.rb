class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :charted_songs
      t.string :image

    end
    add_index :artists, :name, unique: true
  end
end
