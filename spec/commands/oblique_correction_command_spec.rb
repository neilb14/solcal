require 'spec_helper'

describe "ObliqueCorrectionCommand" do
	it "should calculate oblique correction on 2014-12-01" do
		result = {julian_century:0.149125142596397,mean_oblique_ecliptic:23.43735}
		SolCal::Commands::ObliqueCorrectionCommand.new(result).execute
		expect(result[:oblique_correction].to_deg).to be_within(0.001).of(23.4349)
	end

	it "should calculate the oblique correction on 2015-08-05" do
		result = {julian_century: 0.15592060232717317}
		SolCal::Commands::ObliqueCorrectionCommand.new(result).execute
		expect(result[:oblique_correction].to_deg).to be_within(0.001).of(23.4349)
	end
end
