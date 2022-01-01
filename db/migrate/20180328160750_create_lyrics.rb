class CreateLyrics < ActiveRecord::Migration[5.1]
  def change
    create_table :lyrics do |t|
      t.references :song, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
