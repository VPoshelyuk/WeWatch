class ShowsController < ApplicationController
    def index
        # if user input in params, show filtered results 
        # otherwise show everything 
        if search_shows != nil
            @shows = Show.find_by(name: params[:q])
            # redirect_to shows_path(@shows)
            render :index
        else
            @shows = Show.all.sort_by{ |show| show.created_at }
        end
    end

    def show
        in_database = Show.find(params[:id])
        TMDBApi.all_the_season_info(params[:id]) if !in_database.num_of_seasons
        @show = Show.find(params[:id])
        if @show.views.find{|view| view.user_id == session[:user_id]}
            @view = @show.views.find{|view| view.user_id == session[:user_id]}
        else
            @view = View.new
        end
        @seasons = @show.seasons
        @image_path  = @show.poster_path
    end

    def search_shows 
        @shows = Show.find_by(name: params[:q])
    end 
end
 