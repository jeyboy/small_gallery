class UserActivity < ActiveRecord::Base
  ACTIVITY_TYPES = { 'navigation' => 0, 'user_sign_in' => 1, 'user_sign_out' => 2, 'likes' => 3, 'comments' => 4 }

  serialize :info, Hash
  belongs_to :user

  def message
    case activity_id
      when 0
        "go to (#{info[:type]}) #{info[:path]}"
      when 1
        "sign in at #{info[:time]}"
      when 2
        "sign out at #{info[:time]}"
      when 3
        "set like for picture with id #{info[:id]}"
      when 4
        "set comment '#{info[:text]}' for picture with id #{info[:id]}"
      else
        'Unrecognized type'
    end
  end
end
