module SolCal
	module Commands
		autoload :NamingConvention, 			'solcal/commands/naming_convention'
		autoload :BaseCommand, 					'solcal/commands/base_command'
		autoload :JulianCenturyCommand, 		'solcal/commands/julian_century_command'
		autoload :GeometricMeanLongCommand,		'solcal/commands/geometric_mean_long_command'
		autoload :GeometricMeanAnomCommand,		'solcal/commands/geometric_mean_anom_command'
		autoload :AppLongitudeCommand,			'solcal/commands/app_longitude_command'
		autoload :DeclinationCommand,			'solcal/commands/declination_command'
		autoload :HaSunriseCommand,				'solcal/commands/ha_sunrise_command'
		autoload :DurationCommand,				'solcal/commands/duration_command'
		autoload :SunriseCommand,				'solcal/commands/sunrise_command'
		autoload :SunsetCommand,				'solcal/commands/sunset_command'
	end
end