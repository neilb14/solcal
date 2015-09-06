require 'spec_helper'

describe "GeometricMeanLongCommand" do
	it "should calculate the geometric mean longitude on 2014-12-01" do
		result = {julian_century:0.149125142596397}
		SolCal::Commands::GeometricMeanLongCommand.new(result).execute
		expect(result[:geometric_mean_long].to_deg).to be_within(0.0001).of(249.0864)
	end

	it "should calculate the geometric mean longitude on 2015-08-05" do
		result = {julian_century:0.15592060232717317}
		SolCal::Commands::GeometricMeanLongCommand.new(result).execute
		expect(result[:geometric_mean_long].to_deg).to be_within(0.0001).of(133.7282)
	end
end
