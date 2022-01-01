class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.integer :position
      t.references :song, foreign_key: true
      t.references :playlist, foreign_key: true

      t.timestamps
    end
    add_index :tracks, [:playlist_id, :position], unique: true
  end
end
