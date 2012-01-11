class UserActivityController < ApplicationController
  def index
    @users = User.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @user_id = params[:user_id]
    @activities = UserActivity.where(:user_id => @user_id, :data_type => UserActivity::ACTIVITY_TYPES[params[:id]]).paginate(:page => params[:page], :per_page => 10)
  end
end
