require 'spec_helper'

describe "CivilDuskCommand" do
	before :each do
		@result = {julian_century:0.149125142596397, latitude:SolCal::Angle.from_deg(53.5333),declination:SolCal::Angle.from_deg(-21.7958) ,solar_noon:0.515931}
		@command = SolCal::Commands::CivilDuskCommand.new(@result)
	end

	it "should execute" do
		@command.execute
		expect(@result[:civil_dusk].to_s).to eql("17:00")
	end
end
