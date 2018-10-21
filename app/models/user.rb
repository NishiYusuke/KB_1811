class User < ApplicationRecord
	belongs_to :room
	has_many :histories

	def in_or_out
		history = self.histories.order(:created_at).last
		if history!=nil then
			return history.in_or_out
		end
		return false
	end

	def average_leave_time
		times = []
		self.histories.limit(3).each do |history|
			times.push time_ago_in_words(history.created_at).hours
		end
		times.inject{ |sum, el| sum + el }.to_f / times.size
	end
end

