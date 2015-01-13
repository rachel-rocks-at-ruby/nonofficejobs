class Brainstorm < ActiveRecord::Base
  belongs_to :user

  default_scope { order('created_at DESC') }

  # validates :user, presence: true
  # validates :title, length: { minimum: 2 }, presence: true
  # validates :description, length: { minimum: 8 }, presence: true
end
