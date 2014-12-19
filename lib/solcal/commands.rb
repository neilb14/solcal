module SolCal
	module Commands
		autoload :NamingConvention, 			'solcal/commands/naming_convention'
		autoload :BaseCommand, 					'solcal/commands/base_command'
		autoload :JulianCenturyCommand, 		'solcal/commands/julian_century_command'
		autoload :GeometricMeanLongCommand,		'solcal/commands/geometric_mean_long_command'
		autoload :GeometricMeanAnomCommand,		'solcal/commands/geometric_mean_anom_command'
		autoload :DurationCommand,				'solcal/commands/duration_command'
		autoload :SunriseCommand,				'solcal/commands/sunrise_command'
	end
end