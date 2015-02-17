class Vote < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :post
  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }
end
