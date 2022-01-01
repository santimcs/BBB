json.extract! song, :id, :year, :rank, :title, :name, :code, :mp3, :duration, :will_upload, :uploaded, :publish_date, :created_at, :updated_at
json.url song_url(song, format: :json)
