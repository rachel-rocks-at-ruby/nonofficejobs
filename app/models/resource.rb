class Resource < ActiveRecord::Base
	belongs_to :job
	belongs_to :user
end
