class ShowsController < ApplicationController
    def index
        # if user input in params, show filtered results 
        # otherwise show everything 
        # byebug
        @shows = if params[:q] != nil
                    Show.search_shows(params[:q])
                 else
                    Show.all
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

   
end
 