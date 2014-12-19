require 'spec_helper'

describe "VarYCommand" do
	before :each do
		@result = {oblique_correction:SolCal::Angle.from_deg(23.4349)}
		@command = SolCal::Commands::VarYCommand.new(@result)
	end

	it "should execute" do
		@command.execute
		expect(@result[:var_y]).to be_within(0.0001).of(0.043018)
	end
end
