class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :timeoutable and :omniauthable , :validatable, :confirmable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :pictures, :through => :likes
  has_many :likes
  has_many :comments
  has_many :user_activities, :dependent => :destroy

  validates :email, :uniqueness => {:case_sensitive => false}, :format => {:with => Devise.email_regexp}
  validates :email, :password, :password_confirmation, :presence => true, :length => {:minimum => 3, :maximum => 60}

  def add_sign_in_act
    add_act 'user_sign_in'
  end

  def add_sign_out_act
    add_act 'user_sign_out'
  end

  protected
  def add_act type
    UserActivity.create(
        :user_id => id,
        :activity_id => UserActivity::ACTIVITY_TYPES[type],
        :info => {:time => DateTime.now}
    )
  end
end
