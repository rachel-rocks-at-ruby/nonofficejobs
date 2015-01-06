class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :job

  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 4 }, presence: true
  validates :body, length: { minimum: 10 }, presence: true
  validates :job, presence: true
  validates :user, presence: true
end
