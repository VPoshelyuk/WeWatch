class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.create(comment_params)
        redirect_to episode_path(params[:comment][:episode_id])
    end

    private

    def comment_params
        params.require(:comment).permit(:user_id, :episode_id, :comment)
    end
end
