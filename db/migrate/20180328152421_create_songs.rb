class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.integer :year
      t.integer :rank
      t.string :title
      t.references :artist, foreign_key: true
      t.string :code
      t.string :mp3
      t.integer :duration, default: 300
      t.boolean :will_upload, default: false
      t.boolean :uploaded, default: false
      t.date :publish_date

    end
    add_index :songs, [:year, :rank], unique: true
  end
end
