class User < ApplicationRecord
	belongs_to :room
	has_many :histories

	def in_or_out()
		history = self.histories.order(:created_at).last
		if history!=nil then
			return history.in_or_out
		end
		return false
	end
end

