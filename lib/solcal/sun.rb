module SolCal
	module Sun
		def self.daylight(latitude, longitude, time_zone, date)
			results = {date:date,time_zone:time_zone,latitude:latitude,longitude:longitude}
			SolCal::Commands::SunsetCommand.new(results).execute
			SolCal::Commands::SunriseCommand.new(results).execute
			SolCal::Commands::DurationCommand.new(results).execute
			results
		end
	end
end