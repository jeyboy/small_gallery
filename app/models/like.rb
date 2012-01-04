class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :picture, :counter_cache => :likes_count

  validates :user_id, :picture_id, :numericality => true, :presence => true, :if => :not_new

  def not_new
    !new_record?
  end

  after_create :add_act

  protected
  def add_act
    UserActivity.create(
        :user_id => user_id,
        :activity_id => UserActivity::ACTIVITY_TYPES['likes'],
        :info => {:id => picture_id}
    )
  end
end
