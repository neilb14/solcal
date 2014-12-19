module SolCal
	module Commands
		class GeometricMeanAnomCommand < BaseCommand
			protected
			def do_execute
				Angle.from_deg(357.52911+julian_century*(35999.05029 - 0.0001537*julian_century))
			end
		end
	end
end