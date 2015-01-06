class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :job

  default_scope { order('created_at DESC') }
end
