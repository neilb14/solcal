module SolCal
	module Sun
		def self.eccent_earth_orbit(julian_century)
			0.016708634-julian_century*(0.000042037+0.0000001267*julian_century)
		end

		def self.equation_of_center(julian_century, geometric_mean_anom)
			Math.sin(geometric_mean_anom.to_rad)*(1.914602-julian_century*(0.004817+0.000014*julian_century))+Math.sin(2*geometric_mean_anom.to_rad)*(0.019993-0.000101*julian_century)+Math.sin(3*geometric_mean_anom.to_rad)*0.000289
		end

		def self.true_anomoly(geometric_mean_anom, equation_of_center)
			geometric_mean_anom.to_deg+equation_of_center
		end

		def self.rad_vector(eccent_earth_orbit, true_anomoly)
			1.000001018*(1-eccent_earth_orbit*eccent_earth_orbit)/(1+eccent_earth_orbit*Math.cos(true_anomoly.to_rad))
		end

		def self.mean_oblique_ecliptic(julian_century)
			23+(26+(21.448-julian_century*(46.815+julian_century*(0.00059-julian_century*0.001813)))/60)/60
		end

		def self.oblique_correction(julian_century, mean_oblique_ecliptic)
			Angle.from_deg(mean_oblique_ecliptic+0.00256*Math.cos(Angle.from_deg(125.04-1934.136*julian_century).to_rad))
		end

		def self.right_ascension(app_longitude, oblique_correction)
			Angle.from_rad(Math.atan2(BigDecimal(Math.cos(oblique_correction.to_rad),9)*BigDecimal(Math.sin(app_longitude.to_rad),9),Math.cos(app_longitude.to_rad)))
		end

		def self.equation_of_time(var_y, geometric_mean_long, geometric_mean_anom, eccent_earth_orbit)
			a = var_y*Math.sin(2*geometric_mean_long.to_rad)
			b = -2*eccent_earth_orbit*Math.sin(geometric_mean_anom.to_rad)
			c = 4*eccent_earth_orbit*var_y*Math.sin(geometric_mean_anom.to_rad)*Math.cos(2*geometric_mean_long.to_rad)
			d = -0.5*var_y*var_y*Math.sin(4*geometric_mean_long.to_rad)
			e = -1.25*eccent_earth_orbit*eccent_earth_orbit*Math.sin(2*geometric_mean_anom.to_rad)
			4*Angle.from_rad(a+b+c+d+e).to_deg
		end

		def self.daylight(latitude, longitude, time_zone, date)
			results = {date:date,time_zone:time_zone,latitude:latitude,longitude:longitude}
			SolCal::Commands::GeometricMeanLongCommand.new(results).execute
			SolCal::Commands::GeometricMeanAnomCommand.new(results).execute
			results[:eccent_earth_orbit] = eccent_earth_orbit(results[:julian_century])
			results[:oblique_correction] = oblique_correction(results[:julian_century], mean_oblique_ecliptic(results[:julian_century]))
			results[:equation_of_center] = equation_of_center(results[:julian_century], results[:geometric_mean_anom])
			SolCal::Commands::VarYCommand.new(results).execute
			results[:equation_of_time] = equation_of_time(results[:var_y],results[:geometric_mean_long], results[:geometric_mean_anom], results[:eccent_earth_orbit])
			SolCal::Commands::SunsetCommand.new(results).execute
			SolCal::Commands::SunriseCommand.new(results).execute
			SolCal::Commands::DurationCommand.new(results).execute
			results
		end
	end
end