module SolCal
	module Commands
		class GeometricMeanLongCommand < BaseCommand
			attr_accessor :result

			def initialize(data)
				@julian_century = data[:julian_century]
			end

			def execute
				@result = Angle.from_deg((280.46646+@julian_century*(36000.76983 + @julian_century*0.0003032))%360)
			end
		end
	end
end