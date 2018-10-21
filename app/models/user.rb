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

	#12を境界にする
	def average_leave_time
		times = []
		self.histories.limit(3).each do |history|
			#times.push time_ago_in_words(history.created_at).hours
			old = time_bias(history.created_at.hour)
			now = time_bias(Time.zone.now.hour)
			puts old
			puts now
			times.push ( old - now ).to_i
		end
		return times.inject{ |sum, el| sum + el }.to_f / times.size
	end

	def time_bias(time)
		if time < 12 then
			time += 12
		end
		time
	end
end

