require 'spec_helper'

describe "MeanObliqueEclipticCommand" do
	before :each do
		@result = {julian_century:0.149125142596397}
		@command = SolCal::Commands::MeanObliqueEclipticCommand.new(@result)
	end

	it "should execute" do
		@command.execute
		expect(@result[:mean_oblique_ecliptic]).to be_within(0.001).of(23.43735)
	end
end
