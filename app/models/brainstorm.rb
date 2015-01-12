class Brainstorm < ActiveRecord::Base
  belongs_to :user

  default_scope { order('created_at DESC') }

  validates :user, presence: true
  validates :title, length: { minimum: 4 }, presence: true
  validates :description, length: { minimum: 15 }, presence: true
end
