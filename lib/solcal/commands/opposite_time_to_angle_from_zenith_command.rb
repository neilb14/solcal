module SolCal
	module Commands
		class OppositeTimeToAngleFromZenithCommand < BaseCommand
			protected
			def do_execute
				return "The sun will not reach #{angle_from_zenith} degrees from zenith today." unless ha_angle_to_zenith
				SolCal::TimeOfDay.new(solar_noon+ha_angle_to_zenith.to_deg*4/1440)
			end
		end
	end
end