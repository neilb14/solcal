require 'spec_helper'

describe "GeometricMeanLongCommand" do
	before :each do
		@command = SolCal::Commands::GeometricMeanLongCommand.new({julian_century:0.149125142596397})
	end

	it "should execute" do
		@command.execute
		expect(@command.result.to_deg).to be_within(0.0001).of(249.0864)
	end
end
