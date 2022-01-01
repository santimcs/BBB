json.extract! playlist, :id, :name, :artists, :created_at, :updated_at
json.url playlist_url(playlist, format: :json)
