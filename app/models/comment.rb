class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  default_scope { order('created_at DESC') }

  validates :body, length: { minimum: 2 }
  validates :body, presence: true
  validates :user_id, presence: true
end
