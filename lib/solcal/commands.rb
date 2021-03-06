module SolCal
	module Commands
		autoload :NamingConvention, 			'solcal/commands/naming_convention'
		autoload :BaseCommand, 					'solcal/commands/base_command'
		autoload :JulianCenturyCommand, 		'solcal/commands/julian_century_command'
		autoload :GeometricMeanLongCommand,		'solcal/commands/geometric_mean_long_command'
		autoload :GeometricMeanAnomCommand,		'solcal/commands/geometric_mean_anom_command'
		autoload :EccentEarthOrbitCommand,		'solcal/commands/eccent_earth_orbit_command'
		autoload :MeanObliqueEclipticCommand,	'solcal/commands/mean_oblique_ecliptic_command'
		autoload :ObliqueCorrectionCommand,		'solcal/commands/oblique_correction_command'
		autoload :RightAscensionCommand,		'solcal/commands/right_ascension_command'
		autoload :EquationOfCenterCommand,		'solcal/commands/equation_of_center_command'
		autoload :EquationOfTimeCommand,		'solcal/commands/equation_of_time_command'
		autoload :TrueLongitudeCommand,			'solcal/commands/true_longitude_command'
		autoload :AppLongitudeCommand,			'solcal/commands/app_longitude_command'
		autoload :SolarNoonCommand,				'solcal/commands/solar_noon_command'
		autoload :DeclinationCommand,			'solcal/commands/declination_command'
		autoload :VarYCommand,					'solcal/commands/var_y_command'
		autoload :HaSunriseCommand,				'solcal/commands/ha_sunrise_command'
		autoload :DurationCommand,				'solcal/commands/duration_command'
		autoload :SunriseCommand,				'solcal/commands/sunrise_command'
		autoload :SunsetCommand,				'solcal/commands/sunset_command'
		autoload :DaylightCommand,				'solcal/commands/daylight_command'
		autoload :HaCivilTwighlightCommand,		'solcal/commands/ha_civil_twighlight_command'
		autoload :CivilDawnCommand,				'solcal/commands/civil_dawn_command'
		autoload :CivilDuskCommand,				'solcal/commands/civil_dusk_command'
		autoload :HaAngleToZenithCommand,		'solcal/commands/ha_angle_to_zenith_command'
		autoload :TimeToAngleFromZenithCommand,	'solcal/commands/time_to_angle_from_zenith_command'
		autoload :OppositeTimeToAngleFromZenithCommand,	'solcal/commands/opposite_time_to_angle_from_zenith_command'
		autoload :AngleToZenithAtTimeCommand, 'solcal/commands/angle_to_zenith_at_time_command'

		extend NamingConvention

		def self.run(name, data)
			Object.const_get(get_classname_from(name)).new(data).execute
		end
	end
end