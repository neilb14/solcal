module SolCal
	module Sun
		def self.rise(solar_noon, ha_sunrise_in_deg)
			solar_noon-ha_sunrise_in_deg*4/1440
		end

		def self.set(solar_noon, ha_sunrise_in_deg)
			solar_noon+ha_sunrise_in_deg*4/1440
		end

		def self.duration(ha_sunrise_in_deg)
			ha_sunrise_in_deg*8
		end
	end
end