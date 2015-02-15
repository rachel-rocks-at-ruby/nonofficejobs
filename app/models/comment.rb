class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true, dependent: :destroy
  has_many :flags

  default_scope { order('created_at DESC') }

  #validates :body, length: { minimum: 2 }
  #validates :body, presence: true
  #validates :user_id, presence: true
end
