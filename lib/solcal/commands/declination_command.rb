module SolCal
	module Commands
		class DeclinationCommand < BaseCommand
			protected
			def do_execute
				Angle.from_rad(Math.asin(Math.sin(oblique_correction.to_rad)*Math.sin(app_longitude.to_rad)))
			end
		end
	end
end