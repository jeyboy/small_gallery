class Picture < ActiveRecord::Base
  has_attached_file :picture, :styles => {:big => "512x512",:normal => "256x256",:thumb => "128x128>" }
  has_many :comments, :dependent => :destroy
  has_many :users, :through => :likes
  has_many :likes, :dependent => :destroy
  belongs_to :picture_category

  validates :picture_category_id, :numericality => true, :presence => true, :if => :not_new

  def not_new
    !new_record?
  end
end
