class ShowsController < ApplicationController
    def index
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
end
 