class ArtistsController < ApplicationController
    before_action :set_artist, only: [:show, :edit, :update, :destroy]
    
    def index
        @artists = Artist.all
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.new(artist_params)
        if @artist.save
            redirect_to @artist
        else
            render :new
        end
    end

    def update
        if @artist.update(artist_params)
            redirect_to @artist
        else
            render :edit
        end
    end

    private

        def set_artist
            @artist = Artist.find(params[:id])
        end

        def artist_params
            params.require(:artist).permit(:name, :bio)
        end
end
