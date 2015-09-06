require 'spec_helper'

describe "DeclinationCommand" do
	it "should calculate declination for the applied longitude" do
		@result = {oblique_correction:SolCal::Angle.from_deg(247.99),app_longitude:SolCal::Angle.from_deg(23.4349)}
		SolCal::Commands::DeclinationCommand.new(@result).execute
		expect(@result[:declination].to_deg).to be_within(0.001).of(-21.6368)
	end

end
