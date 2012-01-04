class Comment < ActiveRecord::Base
  belongs_to :picture
  belongs_to :user

  validates :user_email, :body, :presence => true

  after_create :add_act

  protected
  def add_act
    UserActivity.create(
        :user_id => user_id,
        :activity_id => UserActivity::ACTIVITY_TYPES['comments'],
        :info => {:id => picture_id, :text => body}
    )
  end
end
