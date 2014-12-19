module SolCal
	module Sun
		def self.eccent_earth_orbit(julian_century)
			0.016708634-julian_century*(0.000042037+0.0000001267*julian_century)
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

		def self.daylight(latitude, longitude, time_zone, date)
			results = {date:date,time_zone:time_zone,latitude:latitude,longitude:longitude}
			SolCal::Commands::GeometricMeanLongCommand.new(results).execute
			SolCal::Commands::GeometricMeanAnomCommand.new(results).execute
			results[:eccent_earth_orbit] = eccent_earth_orbit(results[:julian_century])
			results[:oblique_correction] = oblique_correction(results[:julian_century], mean_oblique_ecliptic(results[:julian_century]))
			SolCal::Commands::SunsetCommand.new(results).execute
			SolCal::Commands::SunriseCommand.new(results).execute
			SolCal::Commands::DurationCommand.new(results).execute
			results
		end
	end
end