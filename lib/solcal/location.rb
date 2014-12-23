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
			results
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