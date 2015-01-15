class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :listings
  has_many :brainstorms
  has_many :categories
  has_many :posts
  has_many :comments
  has_many :mentors

  mount_uploader :avatar, AvatarUploader

   def admin?
     role == 'admin'
   end
   
   def moderator?
     role == 'moderator'
   end
end
