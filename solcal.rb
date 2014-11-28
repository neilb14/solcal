require 'date'
date,latitude,longitude,zenith = ARGV.shift, ARGV.shift.to_f, ARGV.shift.to_f, ARGV.shift.to_f

def adjust(n,limit)
	return n - limit if n > limit
	return n + limit if n < 0
	n
end

def to_rad(deg)
	deg*180/Math::PI
end

def local_hour_angle(time,latitude,zenith)
	anomaly = (0.9856*time)-3.289
	longitude_sun = adjust(anomaly + (1.916 * Math.sin(to_rad(anomaly))) + (0.020*Math.sin(2*to_rad(anomaly))) + 282.634, 360)
	right_ascension = adjust(Math.atan(0.91764 * Math.tan(longitude_sun)), 360)
	left_quad = (longitude_sun/90).floor * 90
	right_quad = (right_ascension/90).floor * 90
	right_ascension = right_ascension + (left_quad - right_quad)
	right_ascension = right_ascension/15
	decension_sin = 0.39782*Math.sin(longitude_sun)
	decension_cos = Math.cos(Math.asin(decension_sin))
	result = (Math.cos(to_rad(zenith)) - (decension_sin*Math.sin(to_rad(latitude))))/(decension_cos*Math.cos(to_rad(latitude)))
	raise "Sun never rises at this location on this date" if result > 1
	raise "Sun never sets at this location on this date" if result < -1
	{local_hour_angle:result, right_ascension: right_ascension}
end

def local_mean_time(hour, right_ascension, time)
	hour + right_ascension - (0.06571*time) - 6.622
end

day_of_year = DateTime.parse(date).strftime("%j").to_i
longitude_hour = longitude/15
time_rising = day_of_year + ((6-longitude_hour)/24)
time_setting = day_of_year + ((18-longitude_hour)/24)
local_hour_angle_rising = local_hour_angle(time_rising,latitude,zenith)
local_hour_angle_setting = local_hour_angle(time_setting,latitude,zenith)
hour_rising = (360 - Math.acos(local_hour_angle_rising[:local_hour_angle]))/15
hour_setting = (Math.acos(local_hour_angle_setting[:local_hour_angle]))/15
local_mean_time_rising = local_mean_time(hour_rising, local_hour_angle_rising[:right_ascension], time_rising)
local_mean_time_setting = local_mean_time(hour_setting, local_hour_angle_setting[:right_ascension], time_setting)

ut_rising = adjust(local_mean_time_rising - longitude_hour, 24)
ut_setting = adjust(local_mean_time_setting - longitude_hour, 24)

local_rising = ut_rising -7
local_setting = ut_setting -7

puts "Rising at [#{local_rising}]"
puts "Setting at [#{local_setting}]"


