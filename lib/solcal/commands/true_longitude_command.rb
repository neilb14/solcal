module SolCal
	module Commands
		class TrueLongitudeCommand < BaseCommand
			protected
			def do_execute
				Angle.from_deg(geometric_mean_long.to_deg+equation_of_center)
			end
		end
	end
end
