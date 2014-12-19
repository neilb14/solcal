require 'spec_helper'

describe "ObliqueCorrectionCommand" do
	before :each do
		@result = {julian_century:0.149125142596397,mean_oblique_ecliptic:23.43735}
		@command = SolCal::Commands::ObliqueCorrectionCommand.new(@result)
	end

	it "should execute" do
		@command.execute
		expect(@result[:oblique_correction].to_deg).to be_within(0.001).of(23.4349)
	end
end
