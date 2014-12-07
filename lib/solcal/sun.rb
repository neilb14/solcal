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

		def self.equation_of_center(julian_century, geometric_mean_anom)
			Math.sin(geometric_mean_anom.to_rad)*(1.914602-julian_century*(0.004817+0.000014*julian_century))+Math.sin(2*geometric_mean_anom.to_rad)*(0.019993-0.000101*julian_century)+Math.sin(3*geometric_mean_anom.to_rad)*0.000289
		end

		def self.true_longitude(geometric_mean_long, equation_of_center)
			geometric_mean_long+equation_of_center
		end

		def self.true_anomoly(geometric_mean_anom, equation_of_center)
			geometric_mean_anom.to_deg+equation_of_center
		end

		def self.rad_vector(eccent_earth_orbit, true_anomoly)
			1.000001018*(1-eccent_earth_orbit*eccent_earth_orbit)/(1+eccent_earth_orbit*Math.cos(true_anomoly.to_rad))
		end

		def self.app_longitude(true_longitude, julian_century)
			true_longitude-0.00569-0.00478*Math.sin(Angle.from_deg(125.04-1934.136*julian_century).to_rad)
		end

		def self.mean_oblique_ecliptic(julian_century)
			23+(26+(21.448-julian_century*(46.815+julian_century*(0.00059-julian_century*0.001813)))/60)/60
		end

		def self.oblique_correction(julian_century, mean_oblique_ecliptic)
			mean_oblique_ecliptic+0.00256*Math.cos(Angle.from_deg(125.04-1934.136*julian_century).to_rad)
		end

		def self.right_ascension(app_longitude, oblique_correction)
			Angle.from_rad(Math.atan2(BigDecimal(Math.cos(oblique_correction.to_rad),9)*BigDecimal(Math.sin(app_longitude.to_rad),9),Math.cos(app_longitude.to_rad)))
		end

		def self.declination(app_longitude, oblique_correction)
			Angle.from_rad(Math.asin(Math.sin(oblique_correction.to_rad)*Math.sin(app_longitude.to_rad)))
		end

		def self.var_y(oblique_correction)
			Math.tan(oblique_correction.div(2).to_rad)**2
		end
	end
end