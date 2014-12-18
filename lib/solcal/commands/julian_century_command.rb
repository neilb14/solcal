module SolCal
	module Commands
		class JulianCenturyCommand < BaseCommand
			def initialize(data)
				super(data)
				@year,@month,@day,@timezone = data[:date].year, data[:date].month, data[:date].day, data[:time_zone]
			end

			protected
			def do_execute
				(DateTime.new(@year,@month,@day,12,0,0,@timezone).jd.to_f - 2451545)/36525
			end
		end
	end
end