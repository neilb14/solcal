require 'spec_helper'

describe "HaCivilTwighlightCommand" do
	before :each do
		@result = {julian_century:0.149125142596397, latitude:SolCal::Angle.from_deg(53.5333),declination:SolCal::Angle.from_deg(-21.7958) ,solar_noon:0.515931}
		@command = SolCal::Commands::HaCivilTwighlightCommand.new(@result)
	end

	it "should execute" do
		@command.execute
		expect(@result[:ha_civil_twighlight].to_deg).to be_within(0.0001).of(69.4109)
	end
end
