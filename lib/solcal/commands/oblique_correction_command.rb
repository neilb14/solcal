module SolCal
	module Commands
		class ObliqueCorrectionCommand < BaseCommand
			protected
			def do_execute
				Angle.from_deg(mean_oblique_ecliptic+0.00256*Math.cos(Angle.from_deg(125.04-1934.136*julian_century).to_rad))
			end
		end
	end
end