class Post < ActiveRecord::Base
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user
  belongs_to :job
  mount_uploader :image

  default_scope { order('created_at DESC') }

  # validates :title, length: { minimum: 2 }, presence: true
  # validates :body, length: { minimum: 10 }, presence: true
  # validates :job, presence: true
  # validates :user, presence: true
end
