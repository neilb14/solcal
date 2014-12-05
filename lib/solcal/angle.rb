require 'bigdecimal'

module  SolCal
	class Angle
		def initialize(rad)
			@angle_in_rad = rad
		end

		def self.from_deg(deg)
			Angle.new(deg*BigDecimal.new(Math::PI,9).div(180,9))
		end

		def self.from_rad(rad)
			Angle.new(BigDecimal.new(rad,9))
		end

		def to_rad
			@angle_in_rad
		end

		def to_deg
			@angle_in_rad*BigDecimal.new(180,9)/BigDecimal.new(Math::PI,9)
		end
	end
end