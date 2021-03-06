class Brainstorm < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :favorites, :as => :favorable, dependent: :destroy
  
  default_scope { order('created_at DESC') }

  #validates :user, presence: true
  #validates :title, length: { minimum: 2 }, presence: true
  #validates :description, length: { minimum: 5 }, presence: true
end
