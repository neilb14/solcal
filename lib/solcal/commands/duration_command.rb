module SolCal
	module Commands
		class DurationCommand < BaseCommand
			protected
			def do_execute
				8*ha_sunrise.to_deg
			end
		end
	end
end