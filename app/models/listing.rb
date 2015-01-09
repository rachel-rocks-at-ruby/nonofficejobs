class Listing < ActiveRecord::Base
  belongs_to :category

  default_scope { order('created_at DESC') }
end
