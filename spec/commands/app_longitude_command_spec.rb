require 'spec_helper'

describe "AppLongitudeCommand" do
	it "should calculate the applied longitude on 2014-12-01" do
		result = {true_longitude:SolCal::Angle.from_deg(247.9944),julian_century:0.149125142596397}
		SolCal::Commands::AppLongitudeCommand.new(result).execute
		expect(result[:app_longitude].to_deg).to be_within(0.01).of(247.99)
	end

	it "should calculate the applied longitude on 2015-08-05" do
		result = {true_longitude:SolCal::Angle.from_deg(247.9944),julian_century:0.15592060232717317}
		SolCal::Commands::AppLongitudeCommand.new(result).execute
		expect(result[:app_longitude].to_deg).to be_within(0.01).of(247.99)
	end
end
