class Category < ActiveRecord::Base
  has_many :jobs, dependent: :destroy
  has_many :listings, dependent: :destroy

  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 4 }, presence: true
end
