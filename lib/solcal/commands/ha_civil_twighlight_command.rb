module SolCal
	module Commands
		class HaCivilTwighlightCommand < BaseCommand
			protected
			def do_execute
				a = Math.cos(Angle.from_deg(96).to_rad)
				b = Math.cos(latitude.to_rad)*Math.cos(declination.to_rad)
				c = Math.tan(latitude.to_rad)*Math.tan(declination.to_rad)
				Angle.from_rad(Math.acos(a/b-c))
			end
		end
	end
end
