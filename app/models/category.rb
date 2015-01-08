class Category < ActiveRecord::Base
  has_many :jobs

  default_scope { order('created_at DESC') }
end
