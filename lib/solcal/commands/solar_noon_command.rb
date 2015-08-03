module SolCal
	module Commands
		class SolarNoonCommand < BaseCommand
			protected
			def do_execute
				(720-4*longitude.to_deg-equation_of_time+time_zone*60)/1440
			end
		end
	end
end
