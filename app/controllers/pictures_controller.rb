class PicturesController < ApplicationController
  def index
    @pictures = Picture.joins(:picture_category).where("picture_categories.title = ?", params[:category]).paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @picture = Picture.includes(:comments).find_by_id(params[:picture_id])
    @current_user_like = @picture.likes_count == 0 ? false : !@user.likes.find_by_picture_id(params[:picture_id]).blank?
  end

  def show_all
    @pictures = Picture.order("likes_count DESC").paginate(:page => params[:page], :per_page => 5)
    @size = :thumb
    render :action => :index
  end
end
