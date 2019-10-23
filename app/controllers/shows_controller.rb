class ShowsController < ApplicationController
    def index
        # if user input in params, show filtered results 
        # otherwise show everything 
        @shows = Show.all
    end

    def show
        @show = Show.find(params[:id])
        if @show.views.find{|view| view.user_id == session[:user_id]}
            @view = @show.views.find{|view| view.user_id == session[:user_id]}
        else
            @view = View.new
        end

        
        
        @seasons = @show.seasons
    end

    def search_shows 
        @shows = Show.find_by(name: params[:q])
        render :index
    end 
end
 