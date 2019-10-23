class WatchesController < ApplicationController
    def new
        @watch = Watch.new
    end

    def create
        @watch = Watch.create(watch_params)
        redirect_to show_path(params[:watch][:show_id])
    end

    def edit
        @watch = Watch.find(params[:id])
    end

    def update
        @watch = Watch.find(params[:id])
        @watch.delete
        redirect_to show_path(params[:watch][:show_id])
    end

    private

    def watch_params
        params.require(:watch).permit(:user_id, :episode_id)
    end
end
