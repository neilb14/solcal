module SolCal
	module Commands
		class HaSunriseCommand < BaseCommand
			protected
			def do_execute
				a = Math.cos(Angle.from_deg(90.833).to_rad)
				b = Math.cos(latitude.to_rad)*Math.cos(declination.to_rad)
				c = Math.tan(latitude.to_rad)*Math.tan(declination.to_rad)
				Angle.from_rad(Math.acos(a/b-c))
			end
		end
	end
end