require 'spec_helper'

describe "GeometricMeanAnomCommand" do
	before :each do
		@result = {julian_century:0.149125142596397}
		@command = SolCal::Commands::GeometricMeanAnomCommand.new(@result)
	end

	it "should execute" do
		@command.execute
		expect(@result[:geometric_mean_anom].to_deg).to be_within(0.001).of(5725.893)
	end
end
