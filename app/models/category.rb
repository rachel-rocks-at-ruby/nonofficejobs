class Category < ActiveRecord::Base
  has_many :jobs, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_many :brainstorms
  belongs_to :user

  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 2 }, presence: true
end
