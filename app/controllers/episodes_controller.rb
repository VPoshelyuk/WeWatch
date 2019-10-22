class EpisodesController < ApplicationController
    def show
        @episode = Episode.find(params[:id])
        @comments = @episode.comments
    end
end 