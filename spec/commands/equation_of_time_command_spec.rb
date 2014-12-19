require 'spec_helper'

describe "EquationOfTimeCommand" do
	before :each do
		@result = {var_y:0.043018,geometric_mean_long:SolCal::Angle.from_deg(250.072),geometric_mean_anom:SolCal::Angle.from_deg(5726.878),eccent_earth_orbit:0.016702}
		@command = SolCal::Commands::EquationOfTimeCommand.new(@result)
	end

	it "should execute" do
		@command.execute
		expect(@result[:equation_of_time]).to be_within(0.0001).of(11.0596)
	end
end
