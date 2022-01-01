class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  # GET /songs
  # GET /songs.json
  def index
    if params[:keywords].present?
      @keywords = params[:keywords]
      song_search_term = SongSearchTerm.new(@keywords)
      @songs = Song.joins(:artist).where(
        song_search_term.where_clause,
        song_search_term.where_args).
        order(song_search_term.order)
    else
      @songs = Song.limit(100).order(year: :asc, rank: :asc)
    end
  end

  def list_songs
    @songs = Song.where("will_upload = True").order(publish_date: :asc)
  end

  def list_yearly
    @songs = Song.where("year = 1979 AND code <> '' AND rank <= 100 AND nbr=99")
    .order(rank: :asc)
  end

  def uploaded_songs
    @songs = Song.where("uploaded = True").order(year: :asc, rank: :asc)
  end

  def uploaded_rs500
    @songs = Song.where("rs500 < 999 AND uploaded = True").order(id: :desc)
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:year, :rank, :title, :artist_id, :code, :mp3, :duration,
      :will_upload, :uploaded, :publish_date, :playlist, :nbr, :views)
    end
end
