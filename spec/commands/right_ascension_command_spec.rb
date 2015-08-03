require 'spec_helper'

describe "RightAscensionCommand" do
	before :each do
		@result = {app_longitude:SolCal::Angle.from_deg(247.99),oblique_correction:SolCal::Angle.from_deg(23.4349)}
		@command = SolCal::Commands::RightAscensionCommand.new(@result)
	end

	it "should execute" do
		@command.execute
		expect(@result[:right_ascension].to_deg).to be_within(0.001).of(-113.777)
	end
end
