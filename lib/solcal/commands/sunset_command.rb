module SolCal
	module Commands
		class SunsetCommand < BaseCommand
			protected
			def do_execute
				SolCal::TimeOfDay.new(solar_noon+ha_sunrise.to_deg*4/1440)
			end
		end
	end
end