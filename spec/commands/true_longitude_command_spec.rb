require 'spec_helper'

describe "TrueLongitudeCommand" do
	it "should calculate the true longitude on 2014-12-01" do
		result = {geometric_mean_long:SolCal::Angle.from_deg(249.0864),equation_of_center:-1.092}
		SolCal::Commands::TrueLongitudeCommand.new(result).execute
		expect(result[:true_longitude].to_deg).to be_within(0.0001).of(247.9944)
	end

	it "should calculate the true longitude on 2015-08-05" do
		result = {geometric_mean_long:SolCal::Angle.from_deg(133.7282),equation_of_center:-1.092}
		SolCal::Commands::TrueLongitudeCommand.new(result).execute
		expect(result[:true_longitude].to_deg).to be_within(0.0001).of(132.6362)
	end
end
