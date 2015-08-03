module SolCal
	module Commands
		class GeometricMeanLongCommand < BaseCommand
			protected
			def do_execute
				Angle.from_deg((280.46646+julian_century*(36000.76983 + julian_century*0.0003032))%360)
			end
		end
	end
end