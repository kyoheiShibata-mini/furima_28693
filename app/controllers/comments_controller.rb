class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', name: @comment.user.nickname,content: @comment
    end
  end
end

def comment_params
  params.require(:comment).permit(:text ).merge(user_id: current_user.id,item_id: params[:item_id])
end