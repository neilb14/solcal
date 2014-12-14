module SolCal
	class Julian
		def self.century_from(date,time_zone)
			(DateTime.new(date.year,date.month,date.day,12,0,0,time_zone).jd.to_f - 2451545)/36525
		end
	end
end