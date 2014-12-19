require 'spec_helper'

describe "TrueLongitudeCommand" do
	before :each do
		@result = {geometric_mean_long:SolCal::Angle.from_deg(249.0864),equation_of_center:-1.092}
		@command = SolCal::Commands::TrueLongitudeCommand.new(@result)
	end

	it "should execute" do
		@command.execute
		expect(@result[:true_longitude].to_deg).to be_within(0.0001).of(247.9944)
	end
end
