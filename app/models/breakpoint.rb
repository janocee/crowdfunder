class Breakpoint < ActiveRecord::Base
	belongs_to :project

	belongs_to :backers, class_name: "User", foreign_key: 'user_id'
end
