class CommentsController < ApplicationController
  def create
    comment = @user.comments.create(params[:comment])
    render :json => {:status => !comment.new_record?, :create_time => comment.created_at}
  end

  def index
    @comments = Comment.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
  end
end

