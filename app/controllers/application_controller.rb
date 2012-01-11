class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :add_user_action

  def after_sign_in_path_for(resource)
  	:root || stored_location_for(resource) || welcome_path
  end

  def add_user_action
    @user = current_user
    @user.user_activities.create(
        :data_type => UserActivity::ACTIVITY_TYPES['navigation'],
        :info => {:path => request.fullpath, :type => request.method}
    ) if user_signed_in?
  end
end
