module SolCal
	module Commands
		class HaAngleToZenithCommand < BaseCommand
			protected
			def do_execute
				a = Math.cos(Angle.from_deg(angle_from_zenith).to_rad)
				b = Math.cos(latitude.to_rad)*Math.cos(declination.to_rad)
				c = Math.tan(latitude.to_rad)*Math.tan(declination.to_rad)
				d = a/b-c
				return nil unless d >= 0 and d<=1
				Angle.from_rad(Math.acos(d))
			end
		end
	end
end