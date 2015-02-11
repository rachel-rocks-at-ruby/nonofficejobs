class Listing < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :favorites, :as => :favorable, dependent: :destroy

  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 2 }, presence: true
  # validates :location, length: { minimum: 4 }, presence: true
  # validates :description, length: { minimum: 15 }, presence: true
  # validates :category, presence: true
  # validates :user, presence: true
end
