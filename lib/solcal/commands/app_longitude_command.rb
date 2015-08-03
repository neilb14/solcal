module SolCal
	module Commands
		class AppLongitudeCommand < BaseCommand
			protected
			def do_execute
				Angle.from_deg(true_longitude.to_deg-0.00569-0.00478*Math.sin(Angle.from_deg(125.04-1934.136*julian_century).to_rad))
			end
		end
	end
end
