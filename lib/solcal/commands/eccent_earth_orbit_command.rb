module SolCal
	module Commands
		class EccentEarthOrbitCommand < BaseCommand
			protected
			def do_execute
				0.016708634-julian_century*(0.000042037+0.0000001267*julian_century)
			end
		end
	end
end