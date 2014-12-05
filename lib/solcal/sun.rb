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

		def self.geometric_mean_long_in_deg(julian_century)
			(280.46646+julian_century*(36000.76983 + julian_century*0.0003032))%360
		end

		def self.geometric_mean_anom_in_deg(julian_century)
			357.52911+julian_century*(35999.05029 - 0.0001537*julian_century)
		end

		def self.eccent_earth_orbit(julian_century)
			0.016708634-julian_century*(0.000042037+0.0000001267*julian_century)
		end
	end
end