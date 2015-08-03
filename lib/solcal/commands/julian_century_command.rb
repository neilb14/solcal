module SolCal
	module Commands
		class JulianCenturyCommand < BaseCommand
			def initialize(data)
				super(data)
				@year,@month,@day = data[:date].year, data[:date].month, data[:date].day
			end

			protected
			def do_execute
				(DateTime.new(@year,@month,@day,12,0,0,time_zone).jd.to_f - 2451545)/36525
			end
		end
	end
end