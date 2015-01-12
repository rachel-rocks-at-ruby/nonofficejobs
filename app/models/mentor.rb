class Mentor < ActiveRecord::Base
  belongs_to :user
  belongs_to :job

  default_scope { order('created_at DESC') }

  validates :description, length: { minimum: 10 }, presence: true
  # validates :job, presence: true
  validates :user, presence: true
end
