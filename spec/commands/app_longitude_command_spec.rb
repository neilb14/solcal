require 'spec_helper'

describe "AppLongitudeCommand" do
	before :each do
		@result = {true_longitude:SolCal::Angle.from_deg(247.9944),julian_century:0.149125142596397}
		@command = SolCal::Commands::AppLongitudeCommand.new(@result)
	end

	it "should execute" do
		@command.execute
		expect(@result[:app_longitude].to_deg).to be_within(0.01).of(247.99)
	end
end
