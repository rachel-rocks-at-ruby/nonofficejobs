class Category < ActiveRecord::Base
  has_many :jobs, dependent: :destroy
  has_many :listings, dependent: :destroy

  default_scope { order('created_at DESC') }
end
