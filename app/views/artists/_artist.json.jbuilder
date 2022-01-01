json.extract! artist, :id, :name, :charted_songs, :image, :created_at, :updated_at
json.url artist_url(artist, format: :json)
