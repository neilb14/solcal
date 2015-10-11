require 'spec_helper'

describe "AngleToZenithAtTimeCommand" do
	it "should calculate the angle to the zenith at 8:33am" do
		result = {julian_century:0.149125142596397, latitude:SolCal::Angle.from_deg(53.5333),declination:SolCal::Angle.from_deg(-21.7958) ,solar_noon:0.515931}
		result[:at_time] = (8*60+33)/(24*60.0)
		SolCal::Commands::AngleToZenithAtTimeCommand.new(result).execute
		expect(result[:angle_to_zenith_at_time].to_deg).to be_within(0.1).of(90.1)
	end

	it "should calculate the angle to the zenith at 7:10am on 2015-08-05" do
		result = {julian_century: 0.15592060232717317, latitude:SolCal::Angle.from_deg(53.5333),longitude:SolCal::Angle.from_deg(-113.5), time_zone: -7}
		result[:at_time] = (7*60+10)/(24*60.0)
		SolCal::Commands::AngleToZenithAtTimeCommand.new(result).execute
		expect(result[:angle_to_zenith_at_time].to_deg.to_f).to be_within(0.1).of(72.0)
	end

	it "should calculate the angle to zenith at 12:28pm on 2015-12-21" do
		result = {julian_century:0.15969883641341548, latitude:SolCal::Angle.from_deg(53.5333),longitude:SolCal::Angle.from_deg(-113.5), time_zone: -7}
		result[:at_time] = (12*60+28)/(24*60.0)
		SolCal::Commands::AngleToZenithAtTimeCommand.new(result).execute
		expect(result[:angle_to_zenith_at_time].to_deg).to be_within(0.1).of(77.0)
	end

	it "should see the angle to the zenith increase every 15 minute interval" do
		result = {date:Date.new(2015,8,2), latitude:SolCal::Angle.from_deg(53.5333), longitude:SolCal::Angle.from_deg(-113.5) , time_zone: -6}
		result[:at_time] = (6*60+9)/(24*60.0)
		SolCal::Commands::AngleToZenithAtTimeCommand.new(result).execute
		expect(result[:angle_to_zenith_at_time].to_deg).to be_within(1).of(89)

		result = {date:Date.new(2015,8,2), latitude:SolCal::Angle.from_deg(53.5333), longitude:SolCal::Angle.from_deg(-113.5) , time_zone: -6}
		result[:at_time] = (6*60+24)/(24*60.0)
		SolCal::Commands::AngleToZenithAtTimeCommand.new(result).execute
		expect(result[:angle_to_zenith_at_time].to_deg).to be_within(1).of(87)

		result = {date:Date.new(2015,8,2), latitude:SolCal::Angle.from_deg(53.5333), longitude:SolCal::Angle.from_deg(-113.5) , time_zone: -6}
		result[:at_time] = (6*60+39)/(24*60.0)
		SolCal::Commands::AngleToZenithAtTimeCommand.new(result).execute
		expect(result[:angle_to_zenith_at_time].to_deg).to be_within(1).of(85)
	end

end
