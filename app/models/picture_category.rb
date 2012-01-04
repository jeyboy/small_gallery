class PictureCategory < ActiveRecord::Base
  has_many :pictures, :dependent => :destroy

  validates :title, :presence => true, :uniqueness => true
end
