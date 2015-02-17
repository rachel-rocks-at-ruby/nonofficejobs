class User < ActiveRecord::Base
  acts_as_messageable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :listings
  has_many :brainstorms
  has_many :categories
  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :mentors
  has_many :favorites, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, :through => :friendships

  mount_uploader :avatar, AvatarUploader

   def admin?
     role == 'admin'
   end
   
   def moderator?
     role == 'moderator'
   end
end
