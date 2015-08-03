require 'spec_helper'

describe "DurationCommand" do
	before :each do
		@result = {julian_century:0.149125142596397,ha_sunrise:SolCal::Angle.from_deg(59.02064)}
		@command = SolCal::Commands::DurationCommand.new(@result)
	end

	it "should execute" do
		@command.execute
		expect(@result[:duration]).to be_within(0.001).of(472.16513)
	end
end
