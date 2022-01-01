# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20200126034906) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.integer "charted_songs"
    t.string "image"
    t.boolean "chosen", default: false
    t.index ["name"], name: "index_artists_on_name", unique: true
  end

  create_table "df_count", id: false, force: :cascade do |t|
    t.bigint "index"
    t.text "code"
    t.bigint "views"
    t.index ["index"], name: "ix_df_count_index"
  end

  create_table "df_dates", id: false, force: :cascade do |t|
    t.bigint "index"
    t.text "code"
    t.datetime "publish_date"
    t.index ["index"], name: "ix_df_dates_index"
  end

  create_table "df_ranks", id: false, force: :cascade do |t|
    t.bigint "index"
    t.bigint "year"
    t.bigint "rank"
    t.bigint "nbr"
    t.text "title"
    t.text "name"
    t.text "code"
    t.datetime "publish_date"
    t.bigint "views"
    t.index ["index"], name: "ix_df_ranks_index"
  end

  create_table "df_songs", id: false, force: :cascade do |t|
    t.bigint "index"
    t.bigint "year"
    t.bigint "rank"
    t.bigint "nbr"
    t.text "title"
    t.text "name"
    t.text "code"
    t.datetime "publish_date"
    t.bigint "views"
    t.index ["index"], name: "ix_df_songs_index"
  end

  create_table "lyrics", force: :cascade do |t|
    t.bigint "song_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_lyrics_on_song_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "name"
    t.string "artists"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.integer "year"
    t.integer "rank"
    t.string "title"
    t.bigint "artist_id"
    t.string "code"
    t.string "mp3"
    t.integer "duration", default: 300
    t.boolean "will_upload", default: false
    t.boolean "uploaded", default: false
    t.date "publish_date"
    t.boolean "playlist", default: false
    t.integer "nbr", default: 99
    t.bigint "views", default: 0
    t.boolean "processed", default: false
    t.integer "rs500", default: 999
    t.index ["artist_id"], name: "index_songs_on_artist_id"
    t.index ["year", "rank"], name: "index_songs_on_year_and_rank", unique: true
  end

  create_table "tracks", force: :cascade do |t|
    t.integer "position"
    t.bigint "song_id"
    t.bigint "playlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playlist_id", "position"], name: "index_tracks_on_playlist_id_and_position", unique: true
    t.index ["playlist_id"], name: "index_tracks_on_playlist_id"
    t.index ["song_id"], name: "index_tracks_on_song_id"
  end

  add_foreign_key "lyrics", "songs"
  add_foreign_key "songs", "artists"
  add_foreign_key "tracks", "playlists"
  add_foreign_key "tracks", "songs"
end
