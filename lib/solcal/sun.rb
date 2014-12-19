module SolCal
	module Sun
		def self.true_anomoly(geometric_mean_anom, equation_of_center)
			geometric_mean_anom.to_deg+equation_of_center
		end

		def self.rad_vector(eccent_earth_orbit, true_anomoly)
			1.000001018*(1-eccent_earth_orbit*eccent_earth_orbit)/(1+eccent_earth_orbit*Math.cos(true_anomoly.to_rad))
		end

		def self.daylight(latitude, longitude, time_zone, date)
			results = {date:date,time_zone:time_zone,latitude:latitude,longitude:longitude}
			SolCal::Commands::SunsetCommand.new(results).execute
			SolCal::Commands::SunriseCommand.new(results).execute
			SolCal::Commands::DurationCommand.new(results).execute
			results
		end
	end
end