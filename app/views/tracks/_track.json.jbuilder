json.extract! track, :id, :position, :song_id, :playlist_id, :created_at, :updated_at
json.url track_url(track, format: :json)
