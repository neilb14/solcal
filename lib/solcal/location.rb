module SolCal
	class Location
		def initialize(latitude, longitude)
			@latitude, @longitude = Angle.from_deg(latitude), Angle.from_deg(longitude)
		end

		def method_missing(name, *args, &block)
			Commands.run(name, create_data(args[0],args[1],args[2],args[3]))
		end

		def daylight(year,month,day,time_zone)
			results = create_data(year,month,day, time_zone)
			Commands.run(:sunrise, results)
			Commands.run(:sunset, results)
			Commands.run(:duration, results)
			Commands.run(:civil_dawn, results)
			Commands.run(:civil_dusk, results)
			results
		end

		def time_to_angle_from_zenith(year, month, day, time_zone, angle_from_zenith)
			results = create_data(year, month, day, time_zone)
			results[:angle_from_zenith] = angle_from_zenith
			Commands.run(:time_to_angle_from_zenith, results)
			results
		end

		def date_pair(year, month, day, time_zone)
			results = create_data(year,month,day, time_zone)
			Commands.run(:duration, results)
			date = Date.new(year, month, day)
			while(date <= Date.new(year+1, month, day))
				date += 1
				next_results = create_data(date.year, date.month, date.day, time_zone)
				Commands.run(:duration, next_results)
				return next_results if (results[:duration]-next_results[:duration]).abs <= 0.3
			end
		end

		protected
		def create_data(year, month, day, time_zone)
			 {
				latitude: @latitude,
				longitude: @longitude,
				time_zone: time_zone,
				date: Date.new(year,month,day)
			}
		end
	end
end