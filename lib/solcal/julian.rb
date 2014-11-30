module SolCal
	class Julian
		def self.century_from(julian_date)
			(julian_date - 2451545)/36525
		end
	end
end