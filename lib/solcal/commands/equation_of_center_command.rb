module SolCal
	module Commands
		class EquationOfCenterCommand < BaseCommand
			protected
			def do_execute
				Math.sin(geometric_mean_anom.to_rad)*(1.914602-julian_century*(0.004817+0.000014*julian_century))+Math.sin(2*geometric_mean_anom.to_rad)*(0.019993-0.000101*julian_century)+Math.sin(3*geometric_mean_anom.to_rad)*0.000289
			end
		end
	end
end