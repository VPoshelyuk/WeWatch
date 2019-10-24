class SeasonsController < ApplicationController
    def show
        loaded = Season.find(params[:id])
        if loaded.has_episodes_loaded == false
            TMDBApi.all_the_episodes_info(params[:id]) if Season.find(params[:id])
            loaded.update(has_episodes_loaded: 1)
        end
        @season = Season.find(params[:id])
        @watches = Watch.all.where(user_id: session[:user_id],watched: true)
        @view = @season.show.views.find{|view| view.user_id == session[:user_id]}
    end
end
