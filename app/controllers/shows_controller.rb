class ShowsController < ApplicationController
    def index
        # if user input in params, show filtered results 
        # otherwise show everything 
        if search_shows != nil
            @shows = Show.find_by(name: params[:q])
            # redirect_to shows_path(@shows)
            render :index
        else
            @shows = Show.all
        end
    end

    def show
        @show = Show.find(params[:id])
        if @show.views.find{|view| view.user_id == session[:user_id]}
            @view = @show.views.find{|view| view.user_id == session[:user_id]}
        else
            @view = View.new
        end

        
        @watches = Watch.all.where(user_id: session[:user_id],watched: true)
        @seasons = @show.seasons
    end

    def search_shows 
        @shows = Show.find_by(name: params[:q])
    end 
end
 