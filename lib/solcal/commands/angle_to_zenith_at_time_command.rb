module SolCal
	module Commands
		class AngleToZenithAtTimeCommand < BaseCommand
			protected
			def do_execute
				ha_angle_at_time = Angle.from_deg((solar_noon - at_time)*1440/4)
				d = Math.cos(ha_angle_at_time.to_rad)
				b = Math.cos(latitude.to_rad)*Math.cos(declination.to_rad)
				c = Math.tan(latitude.to_rad)*Math.tan(declination.to_rad)
				a = (d+c)*b
				Angle.from_rad(Math.acos(a))			
			end
		end
	end
end