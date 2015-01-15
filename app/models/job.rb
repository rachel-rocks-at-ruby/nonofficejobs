class Job < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :mentors, dependent: :destroy

  # validates :name, length: { minimum: 2 }, presence: true
  # validates :description, length: { minimum: 8 }, presence: true
  # validates :category, presence: true
  # validates :user, presence: true
end
