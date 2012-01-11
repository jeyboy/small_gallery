class UserActivity < ActiveRecord::Base
  ACTIVITY_TYPES = { 'navigation' => 0, 'user_sign_in' => 1, 'user_sign_out' => 2, 'likes' => 3, 'comments' => 4 }

  serialize :info, Hash
  belongs_to :user

  validates :data_type, :uniqueness => {:scope => [:user_id, :created_at]}
end
