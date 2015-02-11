class Job < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :mentors
  has_many :favorites, :as => :favorable, dependent: :destroy


  #validates :name, length: { minimum: 2 }, presence: true
  #validates :description, length: { minimum: 5 }, presence: true
  #validates :category, presence: true
  #validates :user, presence: true
end
