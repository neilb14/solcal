module SolCal
	module Commands
		class RightAscensionCommand < BaseCommand
			protected
			def do_execute
				Angle.from_rad(Math.atan2(BigDecimal(Math.cos(oblique_correction.to_rad),9)*BigDecimal(Math.sin(app_longitude.to_rad),9),Math.cos(app_longitude.to_rad)))
			end
		end
	end
end

