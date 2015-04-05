class Resource < ActiveRecord::Base
	belongs_to :job
	belongs_to :user
	has_many :favorites, :as => :favorable, dependent: :destroy
end
