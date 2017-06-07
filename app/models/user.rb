class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable

  validates :fullname, presence: true, length: {maximum: 50}

  has_many :rooms
  has_many :reservations
  has_many :reviews
  has_many :expreservations
  has_one :approval

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first

    if user 
      return user
    else
    	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.fullname = auth.info.name
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.image = auth.info.image
        user.password = Devise.friendly_token[0,20]
      end
    end
  end

  def self.user_levels
    [
      'regular',
      'professional',
      'silver professional',
      'gold professional'
    ]
  end

  def user_level_readable
    User.user_levels[self.user_level]
  end

  # scopes
  scope :for_approval, lambda {joins(:approval)}
end
