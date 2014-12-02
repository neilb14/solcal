module  SolCal
	class Angle
		def initialize(rad)
			@angle_in_rad = rad
		end

		def self.from_deg(deg)
			Angle.new(deg*180/Math::PI)
		end

		def self.from_rad(rad)
			Angle.new(rad)
		end

		def to_rad
			@angle_in_rad
		end

		def to_deg
			@angle_in_rad*Math::PI/180
		end
	end
end