class LikesController < ApplicationController
  def create
    render :json => {:status => !@user.likes.create(params[:like]).new_record?}
  end
end
