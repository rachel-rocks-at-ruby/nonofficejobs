class Post < ActiveRecord::Base
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :favorites, :as => :favorable, dependent: :destroy
  belongs_to :user
  belongs_to :job
  mount_uploader :image
  has_many :votes, dependent: :destroy

  default_scope { order('created_at DESC') }

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.sum(:value)
  end

  # validates :title, length: { minimum: 2 }, presence: true
  # validates :body, length: { minimum: 10 }, presence: true
  # validates :job, presence: true
  # validates :user, presence: true
end
