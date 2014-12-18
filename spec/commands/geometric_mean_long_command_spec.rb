require 'spec_helper'

describe "GeometricMeanLongCommand" do
	before :each do
		@result = {julian_century:0.149125142596397}
		@command = SolCal::Commands::GeometricMeanLongCommand.new(@result)
	end

	it "should execute" do
		@command.execute
		expect(@result[:geometric_mean_long].to_deg).to be_within(0.0001).of(249.0864)
	end
end
