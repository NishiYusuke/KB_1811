class Room < ApplicationRecord
	has_many :users

	def count
		count = 0
		self.users.each do |user|
			if user.in_or_out then
				count+=1
			end
		end
		return count
	end
end
