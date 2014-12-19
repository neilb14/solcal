require 'spec_helper'

describe "SunsetCommand" do
	before :each do
		@result = {julian_century:0.149125142596397,ha_sunrise:SolCal::Angle.from_deg(59.02064),solar_noon:0.515931}
		@command = SolCal::Commands::SunsetCommand.new(@result)
	end

	it "should execute" do
		@command.execute
		expect(@result[:sunset]).to be_within(0.0001).of(0.679877)
	end
end
