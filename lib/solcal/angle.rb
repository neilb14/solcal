module  SolCal
	class Angle
		def initialize(rad)
			@angle_in_rad = rad
		end

		def self.from_deg(deg)
			Angle.new(deg*Math::PI/180.0)
		end

		def self.from_rad(rad)
			Angle.new(rad)
		end

		def to_rad
			@angle_in_rad
		end

		def to_deg
			@angle_in_rad*180/Math::PI
		end
	end
end