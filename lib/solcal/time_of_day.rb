module SolCal
	class TimeOfDay
		attr_accessor :hour, :minute

		def initialize(num)
			@hour = (num*24).to_i
			@minute = (num*24-hour)*60
		end

		def to_s
			"%02d:%02d" % [hour,minute]
		end
	end
end