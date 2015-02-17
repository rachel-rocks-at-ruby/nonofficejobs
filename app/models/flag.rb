class Flag < ActiveRecord::Base
  belongs_to :comment, dependent: :destroy
  belongs_to :user
end
