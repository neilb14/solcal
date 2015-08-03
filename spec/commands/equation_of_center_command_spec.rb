require 'spec_helper'

describe "EquationOfCenterCommand" do
	before :each do
		@result = {julian_century:0.149125142596397,geometric_mean_anom:SolCal::Angle.from_deg(5725.89261441308)}
		@command = SolCal::Commands::EquationOfCenterCommand.new(@result)
	end

	it "should execute" do
		@command.execute
		expect(@result[:equation_of_center]).to be_within(0.00001).of(-1.09204)
	end
end
