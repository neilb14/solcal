module SolCal
	module Commands
		class JulianCenturyCommand < BaseCommand
			def initialize(data)
				super(data)
				@year,@month,@day = data[:date].year, data[:date].month, data[:date].day
				@hour,@min,@sec = 12,0,0
			end

			protected
			def do_execute				
				(DateTime.new(@year,@month,@day,@hour,@min,@sec,time_zone).jd.to_f - 2451545)/36525
			end
		end
	end
end