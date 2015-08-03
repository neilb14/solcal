module SolCal
	module Commands
		class VarYCommand < BaseCommand
			protected
			def do_execute
				Math.tan(oblique_correction.div(2).to_rad)**2
			end
		end
	end
end