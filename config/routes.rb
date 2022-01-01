Rails.application.routes.draw do
  resources :playlists do
    resources :tracks
  end
  root 'songs#index'

  resources :lyrics
  resources :songs
  resources :artists

  get "/list_songs", to: 'songs#list_songs'
  get "/list_yearly", to: 'songs#list_yearly'
  get "/list_artists", to: 'artists#list_artists'  
  get "/list_tracks/:playlist_id", to: 'tracks#list_tracks'
  get "/list_youtubes/:playlist_id", to: 'tracks#list_youtubes'
  get "/uploaded_songs", to: 'songs#uploaded_songs'
  get "/uploaded_rs500", to: 'songs#uploaded_rs500'
  get "/display", to: 'artists#display'    
  get "/player", to: 'artists#player'    



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
