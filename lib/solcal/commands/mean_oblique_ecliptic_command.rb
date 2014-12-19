module SolCal
	module Commands
		class MeanObliqueEclipticCommand < BaseCommand
			protected
			def do_execute
				23+(26+(21.448-julian_century*(46.815+julian_century*(0.00059-julian_century*0.001813)))/60)/60
			end
		end
	end
end