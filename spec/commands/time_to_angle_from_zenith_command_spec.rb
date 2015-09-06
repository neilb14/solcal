require 'spec_helper'

describe "TimeToAngleFromZenithCommand" do
	it "should calculate the time the sun will reach a 90deg angle from the zenith" do
		@result = {julian_century:0.149125142596397, latitude:SolCal::Angle.from_deg(53.5333),declination:SolCal::Angle.from_deg(-21.7958) ,solar_noon:0.515931}
		@result[:angle_from_zenith] = 90
		SolCal::Commands::TimeToAngleFromZenithCommand.new(@result).execute
		expect(@result[:time_to_angle_from_zenith].to_s).to eql("08:33")
	end

	it "should calculate the time the sun will reach a 72deg angle from the zenith on 2015-08-05" do
		@result = {julian_century:0.15592060, latitude:SolCal::Angle.from_deg(53.5333),longitude:SolCal::Angle.from_deg(-113.5), time_zone: -7}
		@result[:angle_from_zenith] = 72
		SolCal::Commands::TimeToAngleFromZenithCommand.new(@result).execute
		expect(@result[:time_to_angle_from_zenith].to_s).to eql("07:10")
	end

	it "should calculate the time the sun will reach a 72deg angle from the zenith on 2015-08-05" do
		@result = {julian_century:0.15592060, latitude:SolCal::Angle.from_deg(53.5333),longitude:SolCal::Angle.from_deg(-113.5), time_zone: -7}
		@result[:angle_from_zenith] = 72
		SolCal::Commands::TimeToAngleFromZenithCommand.new(@result).execute
		expect(@result[:time_to_angle_from_zenith].to_s).to eql("07:10")
	end

	it "should calculate the time the sun will reach max angle on 2015-12-21" do
		@result = {julian_century:0.15969883641341548, latitude:SolCal::Angle.from_deg(53.5333),longitude:SolCal::Angle.from_deg(-113.5), time_zone: -7}
		@result[:angle_from_zenith] = 76.97
		SolCal::Commands::TimeToAngleFromZenithCommand.new(@result).execute
		expect(@result[:time_to_angle_from_zenith].to_s).to eql("12:28")
	end

	it "should return error when requesting time sun will reach above max angle on 2015-12-21" do
		@result = {julian_century:0.15969883641341548, latitude:SolCal::Angle.from_deg(53.5333),longitude:SolCal::Angle.from_deg(-113.5), time_zone: -7}
		@result[:angle_from_zenith] = 76.96
		SolCal::Commands::TimeToAngleFromZenithCommand.new(@result).execute
		expect(@result[:time_to_angle_from_zenith].to_s).to eql("The sun will not reach 76.96 degrees from zenith today.")
	end
end
