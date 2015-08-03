module SolCal
	module Commands
		class CivilDawnCommand < BaseCommand
			protected
			def do_execute
				SolCal::TimeOfDay.new(solar_noon-ha_civil_twighlight.to_deg*4/1440)
			end
		end
	end
end
