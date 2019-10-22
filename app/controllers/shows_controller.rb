class ShowsController < ApplicationController
    def index
        @shows = Show.all
    end

    def show
        @show = Show.find(params[:id])
        @seasons = @show.seasons
    end
end
 