class Project < ActiveRecord::Base

	has_many :breakpoints

	belongs_to :owner, class_name: "User", foreign_key: 'user_id'


	def pledged
		result = 0

		breakpoints.each do |breakpoint|
			result += breakpoint.pledges.count * breakpoint.pledge_amt
		end
		
		result
	end
end
