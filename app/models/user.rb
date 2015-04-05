class User < ActiveRecord::Base
  acts_as_messageable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :listings
  has_many :brainstorms
  has_many :categories
  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :mentors
  has_many :favorites, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, :through => :friendships
  has_many :resources, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

   def admin?
     role == 'admin'
   end
   
   def moderator?
     role == 'moderator'
   end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      if auth.info.email
        user.email = auth.info.email
      else 
        user.email = 'change@me.com'
      end


      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
    end
  end

  def mailboxer_email(object)
    email
  end
end
