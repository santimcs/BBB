class TracksController < ApplicationController
  before_action :get_playlist
  before_action :set_track, only: [:show, :edit, :update, :destroy]

  # GET /tracks
  # GET /tracks.json
  def index
    @tracks = @playlist.tracks.order('position')
    # @tracks = Track.all
  end

  def list_tracks
    @tracks = @playlist.tracks.order(position: :asc)
  end

  def list_youtubes
    @tracks = @playlist.tracks.order(position: :asc)
  end

  # GET /tracks/1
  # GET /tracks/1.json
  def show
  end

  # GET /tracks/new
  def new
    @track = @playlist.tracks.build
    # @track = Track.new
  end

  # GET /tracks/1/edit
  def edit
  end

  # POST /tracks
  # POST /tracks.json
  def create
    @track = @playlist.tracks.build(track_params)
    # @track = Track.new(track_params)
    respond_to do |format|
      if @track.save
        format.html { redirect_to playlist_tracks_url(@playlist), notice: 'Track was successfully created.' }
        # format.html { redirect_to @track, notice: 'Track was successfully created.' }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { render :new }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracks/1
  # PATCH/PUT /tracks/1.json
  def update
    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to playlist_tracks_url(@playlist), notice: 'Track was successfully updated.' }
        format.json { render :show, status: :ok, location: @track }
      else
        format.html { render :edit }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.json
  def destroy

    @track.destroy
    respond_to do |format|
      format.html { redirect_to (playlist_tracks_path(@playlist)), notice: 'Track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # get_playlist converts the playlist_id given by the routing
    # into an @playlist object, for use here and in the view
    def get_playlist
      @playlist = Playlist.find(params[:playlist_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = @playlist.tracks.find(params[:id])
      # @track = Track.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:position, :song_id, :playlist_id)
    end


end
