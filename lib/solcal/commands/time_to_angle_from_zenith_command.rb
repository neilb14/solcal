module SolCal
	module Commands
		class TimeToAngleFromZenithCommand < BaseCommand
			protected
			def do_execute
				a = Math.cos(Angle.from_deg(angle_from_zenith).to_rad)
				b = Math.cos(latitude.to_rad)*Math.cos(declination.to_rad)
				c = Math.tan(latitude.to_rad)*Math.tan(declination.to_rad)
				d = a/b-c
				return "The sun will not reach #{angle_from_zenith} degrees from zenith today." unless d >= 0 and d<=1
				ha_angle_to_zenith = Angle.from_rad(Math.acos(d))
				SolCal::TimeOfDay.new(solar_noon-ha_angle_to_zenith.to_deg*4/1440)
			end
		end
	end
end