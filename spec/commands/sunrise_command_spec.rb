require 'spec_helper'

describe "SunriseCommand" do
	before :each do
		@result = {julian_century:0.149125142596397,ha_sunrise:SolCal::Angle.from_deg(59.02064),solar_noon:0.515931}
		@command = SolCal::Commands::SunriseCommand.new(@result)
	end

	it "should execute" do
		@command.execute
		expect(@result[:sunrise].to_s).to eql("08:26")
	end
end
