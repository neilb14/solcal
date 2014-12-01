module SolCal
	module Sun
		def self.rise(solar_noon, hour_angle_of_sunrise_in_deg)
			solar_noon-hour_angle_of_sunrise_in_deg*4/1440
		end

		def self.set(solar_noon, hour_angle_of_sunrise_in_deg)
			solar_noon+hour_angle_of_sunrise_in_deg*4/1440
		end

		def self.duration(hour_angle_of_sunrise_in_deg)
			hour_angle_of_sunrise_in_deg*8
		end
	end
end