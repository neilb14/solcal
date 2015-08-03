require 'spec_helper'

describe "CivilDawnCommand" do
	before :each do
		@result = {julian_century:0.149125142596397, latitude:SolCal::Angle.from_deg(53.5333),declination:SolCal::Angle.from_deg(-21.7958) ,solar_noon:0.515931}
		@command = SolCal::Commands::CivilDawnCommand.new(@result)
	end

	it "should execute" do
		@command.execute
		expect(@result[:civil_dawn].to_s).to eql("07:45")
	end
end
