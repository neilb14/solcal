module SolCal
	module Commands
		class EquationOfTimeCommand < BaseCommand
			protected
			def do_execute
					a = var_y*Math.sin(2*geometric_mean_long.to_rad)
					b = -2*eccent_earth_orbit*Math.sin(geometric_mean_anom.to_rad)
					c = 4*eccent_earth_orbit*var_y*Math.sin(geometric_mean_anom.to_rad)*Math.cos(2*geometric_mean_long.to_rad)
					d = -0.5*var_y*var_y*Math.sin(4*geometric_mean_long.to_rad)
					e = -1.25*eccent_earth_orbit*eccent_earth_orbit*Math.sin(2*geometric_mean_anom.to_rad)
					4*Angle.from_rad(a+b+c+d+e).to_deg
			end
		end
	end
end