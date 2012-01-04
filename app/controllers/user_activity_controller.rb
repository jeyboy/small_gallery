class UserActivityController < ApplicationController
  require "will_paginate/array"

  def index
    @users = User.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @user_id = params[:user_id]
    @activities = UserActivity.find_all_by_user_id_and_activity_id(@user_id, UserActivity::ACTIVITY_TYPES[params[:event_type]]).paginate(:page => params[:page], :per_page => 10)
  end
end
