require 'spec_helper'

describe "HaSunriseCommand" do
	before :each do
		@result = {latitude:SolCal::Angle.from_deg(53.5333),declination:SolCal::Angle.from_deg(-21.7958)}
		@command = SolCal::Commands::HaSunriseCommand.new(@result)
	end

	it "should execute" do
		@command.execute
		expect(@result[:ha_sunrise].to_deg).to be_within(0.0001).of(59.02064)
	end
end
