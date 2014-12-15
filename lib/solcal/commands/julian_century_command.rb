module SolCal
	module Commands
		class JulianCenturyCommand < BaseCommand
			attr_accessor :result

			def initialize(data)
				@year,@month,@day,@timezone = data[:date].year, data[:date].month, data[:date].day, data[:time_zone]
			end

			def execute
				@result = (DateTime.new(@year,@month,@day,12,0,0,@timezone).jd.to_f - 2451545)/36525
			end
		end
	end
end